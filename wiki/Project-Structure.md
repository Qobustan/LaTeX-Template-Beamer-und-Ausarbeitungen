# Project Structure

This document provides a comprehensive overview of the repository organization for the LaTeX template project.

## Directory Structure

```
LaTeX-Template-Beamer-und-Ausarbeitungen/
├── .github/                    # GitHub configuration and workflows
│   ├── ISSUE_TEMPLATE/        # Issue templates
│   ├── workflows/             # GitHub Actions CI/CD workflows
│   ├── dependabot.yml         # Dependency update automation
│   └── labeler.yml            # Automatic PR labeling
│
├── Ausarbeitung/              # Written elaboration template
│   ├── Ausarbeitung.tex       # Main LaTeX document (with example content)
│   ├── header.tex             # LaTeX preamble and packages
│   ├── Ausarbeitung.bib       # Bibliography file (example)
│   └── README.md              # Template usage guide
│
├── Vortrag/                   # Beamer presentation template
│   ├── Vortrag.tex            # Main presentation document (with example)
│   ├── header.tex             # Beamer configuration
│   ├── Vortrag.bib            # Bibliography file (example)
│   └── README.md              # Template usage guide
│
├── Besprechung/               # Additional template variants
│   └── Material/              # Alternative template configurations
│       ├── Ausarbeitung/      # Alternative elaboration template
│       └── Vortrag/           # Alternative presentation template
│
├── scripts/                   # Utility scripts
│   ├── generatePdf.sh         # PDF generation script
│   └── abkuerzung.sh          # Abbreviation helper
│
├── task_skripts/              # Task-specific automation
│   ├── bash/                  # Bash scripts
│   │   └── doc_version.sh     # Document versioning
│   └── perl/                  # Perl utilities
│       ├── bibtex2html.pl     # BibTeX conversion
│       ├── texcount.pl        # Word counting
│       └── ...                # Other LaTeX tools
│
├── cleanup/                   # Maintenance and cleanup
│   ├── Remove_Junk_Linux.sh   # Linux cleanup script
│   └── Remove_Junk_Windows.bat # Windows cleanup script
│
├── latex_install/             # Installation guides
│   ├── LaTeX-Install.md       # LaTeX installation guide (English)
│   └── LaTeX-Install.de.md    # LaTeX installation guide (German)
│
├── archive/                   # Historical documentation
│   ├── README.md              # Archive overview
│   ├── CONSOLIDATION-SUMMARY.md # Branch consolidation summary
│   ├── branch-snapshots/      # Historical branch documentation
│   └── unique-content/        # Preserved unique configurations
│
├── legacy/                    # Legacy code and historical files
│   └── README.md              # Legacy documentation
│
├── wiki/                      # Project documentation wiki
│   ├── Home.md                # Wiki home page
│   ├── Getting-Started.md     # Quick start guide
│   └── ...                    # Additional wiki pages
│
├── .gitignore                 # Git ignore patterns
├── .gitattributes             # Git attributes
├── cspell.json                # Spell-checking configuration
├── Dockerfile                 # Docker build environment
├── editorconfig.txt           # Editor configuration
├── DISCLAIMER.txt             # Project disclaimer
├── SECURITY.md                # Security policy
└── README.md                  # Main repository documentation
```

## Key Directories Explained

### Template Directories

#### `Ausarbeitung/` - Written Elaboration Template

Complete template for academic papers and written documents:
- **Purpose**: Template for articles, papers, theses, and written assignments
- **Main file**: `Ausarbeitung.tex`
- **Example content**: Kernel density estimation (shows best practices)
- **Build output**: `Ausarbeitung.pdf`
- **Features**: KOMA-Script class, theorem environments, TikZ support
- **Documentation**: See `Ausarbeitung/README.md`

#### `Vortrag/` - Beamer Presentation Template

Professional presentation template with Beamer:
- **Purpose**: Template for seminar presentations and talks
- **Main file**: `Vortrag.tex`
- **Example content**: Statistical methods presentation (shows best practices)
- **Build output**: `Vortrag.pdf`
- **Features**: Madrid theme, automatic ToC, TikZ diagrams, pause commands
- **Documentation**: See `Vortrag/README.md`

#### `Besprechung/Material/` - Alternative Templates

Additional template variants for different use cases:
- **Purpose**: Alternative configurations and layouts
- **Contents**: Similar templates with different settings

### Automation and Scripts

#### `.github/workflows/` - CI/CD Pipelines

GitHub Actions workflows for automation:
- **`build-and-publish-pdfs.yml`**: Builds PDFs automatically
- **`publish-wiki.yml`**: Syncs wiki documentation
- Other quality assurance workflows

See [CI/CD Workflows](CI-CD-Workflows.md) for detailed documentation.

#### `scripts/` - Build and Utility Scripts

Helper scripts for common tasks:
- **`generatePdf.sh`**: Automated PDF generation for all templates
- **`abkuerzung.sh`**: Abbreviation management

#### `task_skripts/` - Specialized Tools

Collection of Perl and Bash scripts for LaTeX processing:
- BibTeX conversion utilities
- LaTeX expansion and processing
- Document statistics and word counting
- Glossary generation

#### `cleanup/` - Maintenance Scripts

Scripts to clean up temporary LaTeX files:
- **`Remove_Junk_Linux.sh`**: Linux/macOS cleanup
- **`Remove_Junk_Windows.bat`**: Windows cleanup

### Documentation and Resources

#### `latex_install/` - Installation Guides

Comprehensive LaTeX installation instructions:
- **`LaTeX-Install.md`**: English installation guide
- **`LaTeX-Install.de.md`**: German installation guide

#### `wiki/` - Project Wiki

Detailed documentation (synced to GitHub Wiki):
- Getting started guides
- Building and customization instructions
- FAQs and troubleshooting

#### `archive/` - Historical Documentation

Documentation of repository history:
- Branch snapshots and consolidation
- Preserved configurations
- Development history

## Configuration Files

### Version Control

- **`.gitignore`**: Excludes build artifacts, temporary files
- **`.gitattributes`**: Git behavior for different file types

### Code Quality

- **`cspell.json`**: Spell-checking configuration
  - Custom dictionary for technical terms
  - LaTeX-specific exclusions
  - Multi-language support

- **`editorconfig.txt`**: Editor configuration
  - Consistent code style
  - Indentation and line endings

### Build Environment

- **`Dockerfile`**: Containerized LaTeX build environment
  - TeX Live installation
  - Required packages
  - Automated building

## File Types

### LaTeX Files

- Main documents: `*.tex`
- Headers/preambles: `header.tex`
- Bibliography: `*.bib`

### Generated Files (Excluded from Git)

- PDFs: `*.pdf`
- LaTeX auxiliary: `*.aux`, `*.log`, `*.out`, `*.toc`
- BibTeX: `*.bbl`, `*.blg`, `*.bcf`
- Temporary: `*.synctex.gz`, `*.nav`, `*.snm`

### Scripts

- Shell scripts: `*.sh` (Linux/macOS)
- Batch files: `*.bat` (Windows)
- Perl scripts: `*.pl`

## How to Use the Templates

1. **Choose a template** from `Vortrag/` or `Ausarbeitung/`
2. **Read the local README** in that directory
3. **Edit `header.tex`** with your metadata
4. **Replace example content** in the main `.tex` file
5. **Update bibliography** in the `.bib` file
6. **Build** using your preferred method

See [Getting Started](Getting-Started.md) for detailed instructions.

## Next Steps

- Learn how to [Build PDFs](Building-PDFs.md)
- Understand [CI/CD Workflows](CI-CD-Workflows.md)
- Read [Getting Started](Getting-Started.md) guide

---

[← Back to Wiki Home](Home.md)
