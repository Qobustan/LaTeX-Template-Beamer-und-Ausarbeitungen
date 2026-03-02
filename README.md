# LaTeX Template: Beamer Presentations and Written Elaborations

A comprehensive LaTeX template repository for creating professional Beamer presentations and written elaborations. Perfect for academic seminars, research papers, theses, and technical documentation.

**Author:** Yavuzâlp Dal

📚 **[Visit our Wiki](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki)** for comprehensive documentation and guides.
📖 **[Architecture Overview](docs/ARCHITECTURE.md)** — detailed project structure documentation.

---

## Table of Contents

- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Building the PDFs](#building-the-pdfs)
  - [Manual Compilation](#manual-compilation)
  - [Using the Build Script](#using-the-build-script)
  - [Using latexmk](#using-latexmk)
  - [Using Docker](#using-docker)
  - [Using GitHub Actions](#using-github-actions)
- [Modular Header System](#modular-header-system)
- [CI/CD Workflows](#cicd-workflows)
- [Available Scripts](#available-scripts)
- [Contributing](#contributing)
- [Important Notices](#important-notices)
- [Additional Documentation](#additional-documentation)

---

## Repository Structure

```
.
├── Ausarbeitung/            # LaTeX sources for the written elaboration
│   ├── header.tex           # Dispatcher (loads header-common + header-article)
│   ├── header-common.tex    # Common packages (shared with Vortrag)
│   └── header-article.tex   # Article-specific packages
├── Vortrag/                 # LaTeX sources for the presentation
│   ├── header.tex           # Dispatcher (loads header-common + header-beamer)
│   ├── header-common.tex    # Common packages (shared with Ausarbeitung)
│   └── header-beamer.tex    # Beamer-specific packages and theme
├── scripts/                 # Build and utility scripts
├── cleanup/                 # Cleanup scripts for temporary LaTeX files
├── task_skripts/            # Task-specific scripts (bash, perl)
├── docs/                    # Project documentation
├── .github/workflows/       # CI/CD automation
└── wiki/                    # Project wiki documentation
```

---

## Getting Started

This template provides two main document types:

### 1. Beamer Presentation (`Vortrag/`)

A professional Beamer presentation template.

**To use this template:**
1. Navigate to the `Vortrag/` directory
2. Edit `header.tex` to update metadata (author, title, course, etc.)
3. Edit `Vortrag.tex` to replace the example content with your own
4. Edit `Vortrag.bib` to add your references
5. Compile the document (see [Building the PDFs](#building-the-pdfs))

**Key features:**
- Madrid theme (easily customizable)
- Automatic table of contents at section starts
- TikZ support for diagrams
- Bibliography support with BibTeX/biber
- Pause command control for incremental reveals
- German language support (easily changed to English)
- Modular header system

### 2. Written Elaboration (`Ausarbeitung/`)

A KOMA-Script article template for academic papers and written assignments.

**To use this template:**
1. Navigate to the `Ausarbeitung/` directory
2. Edit `header.tex` to update metadata (author, title, course, etc.)
3. Edit `Ausarbeitung.tex` to replace the example content with your own
4. Edit `Ausarbeitung.bib` to add your references
5. Compile the document (see [Building the PDFs](#building-the-pdfs))

**Key features:**
- KOMA-Script scrartcl class (professional German document standards)
- Comprehensive package setup for mathematics, algorithms, and code listings
- Custom theorem environments (Satz, Lemma, Definition, Bemerkung, etc.)
- TikZ support for diagrams
- Bibliography support with BibTeX/biber
- Table of contents toggle
- German language support (easily changed to English)
- Modular header system

---

## Prerequisites

### Required

- **TeX Live** (or MiKTeX on Windows) - LaTeX distribution
  - `pdflatex` or `lualatex` - PDF generation
  - `bibtex` or `biber` - Bibliography management
  - `latexmk` - Automated LaTeX building (recommended)
- **Git** - Version control

### Optional

- **Docker** - For containerized builds (includes LuaLaTeX + full TeX Live)
- **Perl** - Required for certain task scripts in `task_skripts/perl/`
- **chktex** - LaTeX linter (used in CI)
- **cspell** - Spell checker (used in CI)

For detailed installation instructions, see:
- [LaTeX Installation Guide (English)](latex_install/LaTeX-Install.md)
- [LaTeX Installation Guide (German)](latex_install/LaTeX-Install.de.md)

---

## Building the PDFs

### Manual Compilation

Build PDFs using the traditional pdflatex + bibtex multi-pass approach:

```bash
# Build Ausarbeitung
cd Ausarbeitung
pdflatex -interaction=nonstopmode Ausarbeitung.tex
bibtex Ausarbeitung
pdflatex -interaction=nonstopmode Ausarbeitung.tex
pdflatex -interaction=nonstopmode Ausarbeitung.tex

# Build Vortrag
cd ../Vortrag
pdflatex -interaction=nonstopmode Vortrag.tex
bibtex Vortrag
pdflatex -interaction=nonstopmode Vortrag.tex
pdflatex -interaction=nonstopmode Vortrag.tex
```

### Using the Build Script

The `scripts/generatePdf.sh` script handles both documents automatically:

```bash
# Default: pdflatex engine
./scripts/generatePdf.sh

# Using LuaLaTeX
./scripts/generatePdf.sh --engine lualatex

# Using environment variable
export LATEX_ENGINE=lualatex
./scripts/generatePdf.sh

# Show help
./scripts/generatePdf.sh --help
```

On Windows, use `scripts/generatePdf.bat`:

```bat
scripts\generatePdf.bat
scripts\generatePdf.bat --engine lualatex
```

### Using latexmk

Automated building with dependency tracking (recommended):

```bash
# Build Ausarbeitung
cd Ausarbeitung
latexmk -pdf Ausarbeitung.tex
# or with LuaLaTeX:
latexmk -lualatex Ausarbeitung.tex

# Build Vortrag
cd ../Vortrag
latexmk -pdf Vortrag.tex
```

### Using Docker

Build PDFs in a fully reproducible containerized environment:

```bash
# Build the Docker image
docker build -t latex-template .

# Run with default engine (lualatex)
docker run --rm -v $(pwd):/workspace latex-template

# Run with pdflatex
docker run --rm -v $(pwd):/workspace -e LATEX_ENGINE=pdflatex latex-template
```

The Docker image includes:
- Full TeX Live with LuaLaTeX, XeLaTeX, biber, latexmk
- Lua 5.5.0
- Perl with latexindent dependencies
- Python 3 + PyGithub

### Using GitHub Actions

PDFs are automatically built on every push to the `main` branch:

1. Push your changes to the `main` branch
2. GitHub Actions automatically builds both PDFs
3. Download generated PDFs from the workflow artifacts

---

## Modular Header System

The template uses a **modular header system** for maintainability:

| File | Purpose |
|------|---------|
| `header.tex` | Dispatcher: loads common + document-specific headers, plus metadata |
| `header-common.tex` | Packages shared by both Beamer and Article |
| `header-beamer.tex` | Beamer theme, `\trennfolie`, list templates |
| `header-article.tex` | Page geometry, `adjustbox`, `csquotes` |

**To customize your document:**
1. Update metadata in `header.tex` (author, title, course, etc.)
2. Add shared packages to `header-common.tex`
3. Add document-class-specific packages to `header-beamer.tex` or `header-article.tex`

---

## CI/CD Workflows

The repository includes comprehensive GitHub Actions workflows in `.github/workflows/`:

- **`build-and-publish-pdfs.yml`** - Automatically compiles LaTeX documents
- **`docker-image.yml`** - Builds the Docker image
- **`lint.yml`** - Runs chktex on LaTeX files
- **`spellcheck.yml`** - Runs cspell on text files
- **`bibcheck.yml`** - Checks bibliography files for duplicates
- **`stale.yml`** - Closes stale issues/PRs automatically

---

## Available Scripts

### PDF Generation

**`scripts/generatePdf.sh`** (Linux/macOS) / **`scripts/generatePdf.bat`** (Windows)
- Builds both Ausarbeitung and Vortrag PDFs
- Supports `--engine pdflatex` (default) or `--engine lualatex`
- Usage: `./scripts/generatePdf.sh [--engine ENGINE]`

### Cleanup Scripts

**`cleanup/Remove_Junk_Linux.sh`** (Linux/macOS) / **`cleanup/Remove_Junk_Windows.bat`** (Windows)
- Removes temporary LaTeX auxiliary files
- Supports `--quiet` flag (Linux) and `/Q` flag (Windows)
- Usage: `./cleanup/Remove_Junk_Linux.sh`

### Task-Specific Scripts

Located in `task_skripts/`:
- `bash/` - Bash scripts for various tasks
- `perl/` - Perl scripts for text processing

### Branch Management

**`scripts/delete-obsolete-branches.sh`** / **`scripts/delete-obsolete-branches.py`**
- Deletes configured obsolete branches from the repository
- Edit the `OBSOLETE_BRANCHES` list before running
- Dry run: `python3 scripts/delete-obsolete-branches.py --dry-run`

---

## Contributing

Contributions are welcome! Please see our [Contributing Guidelines](CONTRIBUTING.md) for detailed information.

### Quick Start

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Make your changes and test locally by building the PDFs
4. Commit your changes with clear, descriptive messages
5. Push to your fork and open a Pull Request

### Using This as a Template for Your Project

1. Fork or clone the repository
2. Update metadata in `header.tex` files (author, title, course, etc.)
3. Replace example content in `Vortrag.tex` and `Ausarbeitung.tex`
4. Add your bibliography entries to `.bib` files
5. Customize the templates to your needs

---

## Important Notices

### Disclaimer

This project is provided "as is" without warranty. See [DISCLAIMER.txt](DISCLAIMER.txt) for full details.

### Security Policy

For information about supported versions and reporting vulnerabilities, see [SECURITY.md](SECURITY.md).

---

## Additional Documentation

- [Architecture Overview](docs/ARCHITECTURE.md) - Detailed project structure
- [Changelog](docs/CHANGELOG.md) - Version history
- [Contributing Guidelines](CONTRIBUTING.md) - How to contribute
- [LaTeX Installation Guide (English)](latex_install/LaTeX-Install.md)
- [LaTeX Installation Guide (German)](latex_install/LaTeX-Install.de.md)
- [Security Policy](SECURITY.md)

### Wiki Documentation

The `wiki/` directory is automatically synced to the [GitHub Wiki](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki):
- [Getting Started Guide](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki/Getting-Started)
- [Building PDFs](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki/Building-PDFs)
- [CI/CD Workflows](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki/CI-CD-Workflows)
- [FAQ](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki/FAQ)
- [Troubleshooting](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki/Troubleshooting)

---

[![Build all LaTeX projects](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/actions/workflows/build-and-publish-pdfs.yml/badge.svg)](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/actions/workflows/build-and-publish-pdfs.yml)
