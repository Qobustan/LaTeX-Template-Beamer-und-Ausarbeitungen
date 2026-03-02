# Changelog

All notable changes to this project will be documented in this file.

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
