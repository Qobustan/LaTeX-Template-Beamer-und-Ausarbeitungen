# Release Notes – [vX.Y.Z] – YYYY-MM-DD

## Summary

<!-- One-paragraph summary of what this release introduces or fixes. -->

## What's New

- <!-- Feature or improvement 1 -->
- <!-- Feature or improvement 2 -->

## Bug Fixes
# Release Notes Template

Use this template when preparing release notes for a new version of
**LaTeX-Template-Beamer-und-Ausarbeitungen**.

Copy the block below, replace the placeholder text, and paste it into the
GitHub Release description.

---

## Release vX.Y.Z – YYYY-MM-DD

### Summary

<!-- One-paragraph overview of what this release changes or fixes. -->

### What's New

- <!-- Feature / improvement 1 -->
- <!-- Feature / improvement 2 -->

### Bug Fixes

- <!-- Bug fix 1 -->
- <!-- Bug fix 2 -->

## Breaking Changes

- <!-- List any breaking changes and migration instructions. Remove section if none. -->

## Upgrade Instructions

```bash
# Example: pull latest image
docker pull ghcr.io/<owner>/latex-template-ci:<tag>
```

## Known Issues

- <!-- Known limitation or issue. Remove section if none. -->

## Files Changed

| File / Directory | Change type |
|---|---|
| `.github/workflows/` | Added / Modified |
| `test/` | Added |
| `docs/` | Added |

## Contributors

- <!-- @github-username -->

---
> **Note:** For the full history of changes see [CHANGELOG.md](docs/CHANGELOG.md).
### Breaking Changes

- <!-- Describe any breaking changes, or remove this section if none. -->

### Infrastructure / CI

- <!-- Workflow or tooling changes, or remove this section if none. -->
  <!-- Note: QEMU / cross-platform emulation is intentionally not used in  -->
  <!--       the CI pipelines; all builds run on native ubuntu-latest.      -->

### Local Testing

Before tagging a release, verify both templates compile locally:

```bash
# Option A – helper script (requires pdflatex + bibtex in PATH)
./scripts/generatePdf.sh

# Option B – latexmk (recommended; requires latexmk in PATH)
cd Ausarbeitung && latexmk -pdf -interaction=nonstopmode Ausarbeitung.tex && cd ..
cd Vortrag      && latexmk -pdf -interaction=nonstopmode Vortrag.tex      && cd ..

# Option C – Docker (no local TeX installation required)
docker build -t latex-template .
docker run --rm -v "$(pwd)":/app latex-template
```

### Upgrade Notes

<!-- Any steps users must take when upgrading from the previous version,
     or remove this section if none. -->

### Checksums

| File | SHA-256 |
|------|---------|
| <!-- filename --> | <!-- sha256sum output --> |

### Contributors

<!-- @mention contributors, or link to the compare view:
     https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/compare/vPREV...vX.Y.Z -->

---

**Full Changelog:**
https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/blob/main/docs/CHANGELOG.md
# Release Notes — v[VERSION]

**Release Date:** YYYY-MM-DD

## Highlights

<!-- Brief summary of the most important changes in this release -->

## What's New

### Added

- <!-- New feature or file -->

### Changed

- <!-- Modified behaviour or files -->

### Fixed

- <!-- Bug fixes -->

### Removed

- <!-- Deleted features or files -->

## Breaking Changes

<!-- List any breaking changes and migration instructions, or write "None." -->

## Known Issues

<!-- List known issues in this release, or write "None." -->

## Upgrade Instructions

```bash
# Example: pull latest changes
git pull origin main
```

## Contributors

<!-- List contributors to this release, e.g. @username -->

---

*For a full list of changes, see [CHANGELOG](docs/CHANGELOG.md).*
