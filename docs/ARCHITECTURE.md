# Architecture

## Overview

This repository is a general-purpose LaTeX template for creating:
1. **Beamer presentations** (`Vortrag/`) — slide decks using the Beamer document class
2. **Written elaborations** (`Ausarbeitung/`) — academic papers using KOMA-Script (`scrartcl`)

Both document types share a common package set and configuration managed through a **modular header system**.

---

## Directory Structure

```
.
├── Ausarbeitung/                # Written elaboration template
│   ├── Ausarbeitung.tex         # Main document (edit this)
│   ├── Ausarbeitung.bib         # Bibliography (edit this)
│   ├── header.tex               # Dispatcher: loads header-common + header-article
│   ├── header-common.tex        # Common packages (shared with Vortrag)
│   └── header-article.tex       # Article/scrartcl-specific packages
│
├── Vortrag/                     # Beamer presentation template
│   ├── Vortrag.tex              # Main document (edit this)
│   ├── Vortrag.bib              # Bibliography (edit this)
│   ├── header.tex               # Dispatcher: loads header-common + header-beamer
│   ├── header-common.tex        # Common packages (shared with Ausarbeitung)
│   └── header-beamer.tex        # Beamer-specific packages and theme
│
├── scripts/                     # Build and utility scripts
│   ├── generatePdf.sh           # PDF generation (Linux/macOS) – supports pdflatex & lualatex
│   ├── generatePdf.bat          # PDF generation (Windows)
│   ├── delete-obsolete-branches.sh  # Branch cleanup (Bash)
│   └── delete-obsolete-branches.py  # Branch cleanup (Python/PyGithub)
│
├── cleanup/                     # LaTeX auxiliary file cleanup
│   ├── Remove_Junk_Linux.sh     # Cleanup script (Linux/macOS)
│   └── Remove_Junk_Windows.bat  # Cleanup script (Windows)
│
├── task_skripts/                # Task-specific automation scripts
│   ├── bash/                    # Bash scripts
│   └── perl/                    # Perl scripts (LaTeX tooling wrappers)
│
├── .github/                     # GitHub configuration
│   ├── workflows/               # GitHub Actions CI/CD workflows
│   ├── CODEOWNERS               # Code ownership definitions
│   ├── pull_request_template.md # PR template
│   └── dependabot.yml           # Automated dependency updates
│
├── docs/                        # Project documentation
│   ├── ARCHITECTURE.md          # This file
│   ├── CHANGELOG.md             # Version history
│   └── improvement/             # Improvement notes and proposals
│
├── Dockerfile                   # Docker image for containerized LaTeX builds
├── .dockerignore                # Docker build context exclusions
├── VERSION                      # Current version number
├── .gitattributes               # Git line ending and language configuration
├── .gitignore                   # Files/directories excluded from Git
├── .editorconfig                # Editor configuration
├── cspell.json                  # Spell checker configuration
├── README.md                    # Main documentation
├── CONTRIBUTING.md              # Contributor guidelines
└── SECURITY.md                  # Security policy
```

---

## Modular Header System

The header system was refactored from a single monolithic `header.tex` into three files per document type:

### Vortrag/ (Beamer Presentation)

| File | Purpose |
|------|---------|
| `header.tex` | Dispatcher – loads `header-common` then `header-beamer`, plus metadata |
| `header-common.tex` | Packages shared with Ausarbeitung (math, graphics, listings, etc.) |
| `header-beamer.tex` | Beamer theme, `\trennfolie` command, list templates |

### Ausarbeitung/ (Written Elaboration)

| File | Purpose |
|------|---------|
| `header.tex` | Dispatcher – loads `header-common` then `header-article`, plus metadata |
| `header-common.tex` | Packages shared with Vortrag (identical file) |
| `header-article.tex` | Page geometry, `adjustbox`, `csquotes` |

### Why Modular?

- **Single source of truth**: common packages are defined once in `header-common.tex`
- **Easier maintenance**: add a package to one place, affects both document types
- **Clear separation**: document-class-specific config is isolated

---

## Build System

### Engines

The build scripts support two LaTeX engines:

| Engine | Command | Notes |
|--------|---------|-------|
| `pdflatex` | `./scripts/generatePdf.sh` | Default; fastest |
| `lualatex` | `./scripts/generatePdf.sh --engine lualatex` | Full Unicode; required for some packages |

The engine can also be set via the `LATEX_ENGINE` environment variable:

```bash
export LATEX_ENGINE=lualatex
./scripts/generatePdf.sh
```

### Docker

The `Dockerfile` provides a fully reproducible build environment:

- Base: Ubuntu 22.04
- TeX Live with LuaLaTeX, XeLaTeX, biber, latexmk
- Lua 5.5.0 (compiled from source)
- Perl with latexindent dependencies
- Python 3 + PyGithub

```bash
docker build -t latex-template .
docker run --rm -v $(pwd):/workspace latex-template
docker run --rm -v $(pwd):/workspace latex-template --engine lualatex
```

---

## CI/CD Workflows

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `build-and-publish-pdfs.yml` | Push to `main`, manual | Compile PDFs and upload as artifacts |
| `docker-image.yml` | Push to `main`, manual | Build and push Docker image |
| `lint.yml` | Push, PR | Run chktex on `.tex` files |
| `spellcheck.yml` | Push, PR | Run cspell on text files |
| `bibcheck.yml` | Push, PR | Check bibliography files for duplicates |
| `format.yml` | Manual | Validate code formatting |
| `stale.yml` | Scheduled | Mark and close stale issues/PRs |
