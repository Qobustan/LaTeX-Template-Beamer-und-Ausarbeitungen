# ==============================================================================
#
#   FILE: Dockerfile
#
#   DESCRIPTION:
#     Multi-stage Docker image for building LaTeX documents with full
#     TeX Live support, LuaLaTeX, Perl dependencies, and Lua 5.5.0.
#
#   USAGE:
#     docker build -t latex-template .
#     docker run --rm -v $(pwd):/workspace latex-template
#     docker run --rm -v $(pwd):/workspace latex-template --engine lualatex
#
# ==============================================================================

# Use Ubuntu 22.04 LTS as the base image
FROM ubuntu:22.04

# Set non-interactive mode to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && echo "Europe/Berlin" > /etc/timezone

# ──────────────────────────────────────────────────────────────────────────────
# Stage 1: Build Lua 5.5.0 from source
# ──────────────────────────────────────────────────────────────────────────────

# Install build dependencies for Lua
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libreadline-dev \
        curl \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download, compile and install Lua 5.5.0
RUN curl -fsSL https://www.lua.org/ftp/lua-5.5.0.tar.gz -o /tmp/lua-5.5.0.tar.gz \
    && cd /tmp \
    && tar -xzf lua-5.5.0.tar.gz \
    && cd lua-5.5.0 \
    && make linux \
    && make install \
    && lua -v \
    && rm -rf /tmp/lua-5.5.0 /tmp/lua-5.5.0.tar.gz

# ──────────────────────────────────────────────────────────────────────────────
# Stage 2: Install TeX Live and all required LaTeX packages
# ──────────────────────────────────────────────────────────────────────────────

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
        # TeX Live core
        texlive \
        texlive-base \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-lang-german \
        texlive-lang-european \
        # BibTeX / Biber
        texlive-bibtex-extra \
        biber \
        # LuaLaTeX support
        texlive-luatex \
        luatex \
        # XeLaTeX support
        texlive-xetex \
        # Science / Math packages
        texlive-science \
        # Publishers / extra fonts
        texlive-publishers \
        # latexmk for automated compilation
        latexmk \
        # latexindent (formatting tool)
        latexindent \
        # lmodern fonts
        lmodern \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ──────────────────────────────────────────────────────────────────────────────
# Stage 3: Install Perl and required Perl modules for LaTeX tooling
# ──────────────────────────────────────────────────────────────────────────────

RUN apt-get update && apt-get install -y --no-install-recommends \
        perl \
        perl-base \
        libfile-homedir-perl \
        libyaml-tiny-perl \
        libunicode-linebreak-perl \
        liblog-log4perl-perl \
        libgetopt-long-descriptive-perl \
        liblist-moreutils-perl \
        libtext-soundex-perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ──────────────────────────────────────────────────────────────────────────────
# Stage 4: Install Python and additional build tools
# ──────────────────────────────────────────────────────────────────────────────

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        git \
        make \
        wget \
        ghostscript \
        poppler-utils \
        imagemagick \
        fonts-texgyre \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PyGithub for branch management scripts
RUN pip3 install --no-cache-dir PyGithub

# ──────────────────────────────────────────────────────────────────────────────
# Stage 5: Configure workspace
# ──────────────────────────────────────────────────────────────────────────────

# Set the working directory
WORKDIR /workspace

# Copy only required scripts (not full repo content)
COPY scripts/ /workspace/scripts/
COPY cleanup/  /workspace/cleanup/

# Make all scripts executable
RUN find /workspace -name "*.sh" -type f -exec chmod +x {} \; \
    && find /workspace -name "*.py" -type f -exec chmod +x {} \;

# ──────────────────────────────────────────────────────────────────────────────
# Environment variables
# ──────────────────────────────────────────────────────────────────────────────

# Default LaTeX engine (can be overridden at runtime: pdflatex or lualatex)
ENV LATEX_ENGINE=lualatex

# Set PATH to include Lua
ENV PATH="/usr/local/bin:${PATH}"

# ──────────────────────────────────────────────────────────────────────────────
# Entry point
# ──────────────────────────────────────────────────────────────────────────────

# Set the entry point – generate PDFs with the configured engine
ENTRYPOINT ["/bin/bash", "/workspace/scripts/generatePdf.sh"]
