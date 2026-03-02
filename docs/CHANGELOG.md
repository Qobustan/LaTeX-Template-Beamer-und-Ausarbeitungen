# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- CI smoke-test workflow (`.github/workflows/ci-smoke-tests.yml`) using Docker Buildx
  (without QEMU) to build the image, compile a minimal LuaLaTeX document, and run a
  seminar-content scan.
- Minimal LuaLaTeX test document (`test/minimal.tex`) compiled in CI and published
  as a build artefact.
- `RELEASE_NOTES_TEMPLATE.md` – template for writing structured release notes.
- This `CHANGELOG.md` file.

### Changed

### Deprecated

### Removed

### Fixed

### Security
