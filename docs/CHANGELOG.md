# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added
- CI smoke-test workflow (`.github/workflows/ci-smoke-tests.yml`) that compiles
  the Ausarbeitung and Vortrag templates on every push and pull request.
- `docs/CHANGELOG.md` – this file.
- `RELEASE_NOTES_TEMPLATE.md` – template for future release announcements.

---

## [1.0.0] – 2025-01-01

### Added
- Initial LaTeX template for Beamer presentations (`Vortrag/`).
- Initial LaTeX template for written elaborations (`Ausarbeitung/`).
- Meeting/discussion template (`Besprechung/`).
- PDF generation scripts (`scripts/generatePdf.sh`, `scripts/generatePdf.bat`).
- Cleanup scripts (`cleanup/`).
- Docker support (`Dockerfile`).
- GitHub Actions workflows for building, linting, spell-checking, and
  publishing PDFs and wiki documentation.
- Contributing guidelines (`CONTRIBUTING.md`).
- Security policy (`SECURITY.md`).
- LaTeX installation guides (`latex_install/`).

---

[Unreleased]: https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/releases/tag/v1.0.0
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- CI smoke-test workflow (`.github/workflows/ci-smoke-tests.yml`): builds the
  Docker image with `docker/setup-buildx-action@v2` and
  `docker/build-push-action@v4` (host platform only – no QEMU), caches layers
  via `actions/cache`, compiles a minimal LuaLaTeX document with two passes,
  uploads the resulting PDF as a workflow artefact, and performs a seminar-
  content scan that fails the job when seminar-specific strings are found.
- `docs/CHANGELOG.md` – this file, following the Keep a Changelog format.
- `RELEASE_NOTES_TEMPLATE.md` – a reusable Markdown template for release notes.

[Unreleased]: https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/commits/main
- CI smoke-test workflow (`.github/workflows/ci-smoke-tests.yml`) using Docker Buildx
  (without QEMU) to build the image, compile a minimal LuaLaTeX document, and run a
  seminar-content scan.
- Minimal LuaLaTeX test document (`test/minimal.tex`) compiled in CI and published
  as a build artefact.
- `RELEASE_NOTES_TEMPLATE.md` – template for writing structured release notes.
- This `CHANGELOG.md` file.
- CI smoke tests workflow (`.github/workflows/ci-smoke-tests.yml`): Docker build without QEMU, LuaLaTeX smoke test, seminar content check, and optional `generatePdf.sh` integration test.
- `docs/CHANGELOG.md`: This changelog file following Keep a Changelog conventions.
- `RELEASE_NOTES_TEMPLATE.md`: Reusable template for GitHub release notes.

### Changed

### Deprecated

### Removed

### Fixed

### Security

[Unreleased]: https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/compare/main...HEAD
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
