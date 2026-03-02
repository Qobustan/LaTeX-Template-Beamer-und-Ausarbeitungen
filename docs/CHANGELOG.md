# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [2.0.0] – 2026-03-01

### Added

- **Modular header system**: Split monolithic `header.tex` into three files per document type:
  - `header-common.tex` – packages shared between Beamer and Article
  - `header-beamer.tex` – Beamer-specific configuration
  - `header-article.tex` – Article/scrartcl-specific configuration
  - `header.tex` – thin dispatcher that loads the above
- **LuaLaTeX support** in `scripts/generatePdf.sh` via `--engine lualatex` flag
- **LuaLaTeX support** in `scripts/generatePdf.bat` via `--engine lualatex` flag
- `LATEX_ENGINE` environment variable support in build scripts
- `biber` auto-detection in build scripts (falls back to `bibtex`)
- Comprehensive **Dockerfile** with Ubuntu 22.04, full TeX Live, LuaLaTeX, Perl, Python
- `.dockerignore` to minimize Docker build context
- `.github/CODEOWNERS` for automatic PR review assignment
- `.github/pull_request_template.md` for structured PR descriptions
- `VERSION` file tracking template version
- `docs/` directory with architecture documentation and changelog

### Changed

- **Dockerfile**: upgraded from Ubuntu 20.04 minimal image to Ubuntu 22.04 with full TeX Live
- **`scripts/generatePdf.sh`**: added engine selection, `--help` flag, biber/bibtex auto-detection, and refactored to use a `compile_document` helper function
- **`scripts/generatePdf.bat`**: added engine selection and structured output
- **`scripts/delete-obsolete-branches.py`**: made template-generic (removed seminar-specific branch list)
- **`scripts/delete-obsolete-branches.sh`**: made template-generic (uses configurable array)
- **`cleanup/Remove_Junk_Linux.sh`**: added `--quiet` flag, added more file extensions (`fdb_latexmk`, `fls`, `idx`, `ind`, `ilg`, `dvi`, `run.xml`)
- **`cleanup/Remove_Junk_Windows.bat`**: added `/Q` quiet flag, improved output messages
- **`.gitattributes`**: massively expanded with explicit line ending rules for all file types, binary declarations, and Linguist overrides
- **`.gitignore`**: reorganized and extended
- **`cspell.json`**: cleaned up word list (removed seminar-specific terminology), added LaTeX tooling terms
- **`CONTRIBUTING.md`**: updated to be template-generic (removed seminar-specific references)
- **`README.md`**: updated with new modular header system documentation, LuaLaTeX instructions

### Deprecated

- Old monolithic `header.tex` files are preserved as `header.tex.old` in each directory

---

## [1.0.0] – 2025-01-01

### Added

- Initial template with Beamer presentation (`Vortrag/`) and written elaboration (`Ausarbeitung/`)
- Basic `Dockerfile` for containerized builds
- `scripts/generatePdf.sh` and `scripts/generatePdf.bat` for PDF generation
- `cleanup/` scripts for removing LaTeX auxiliary files
- GitHub Actions workflows for building, linting, and spell checking
- Wiki documentation
