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
