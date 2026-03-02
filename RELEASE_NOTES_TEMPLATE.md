# Release Notes – v<!-- VERSION -->

> **Date:** <!-- YYYY-MM-DD -->

## Highlights

<!-- One or two sentences summarising the most important changes. -->

## What's New

<!-- List new features or additions. -->

- 

## Improvements

<!-- List improvements to existing functionality. -->

- 

## Bug Fixes

<!-- List bug fixes. -->

- 

## Breaking Changes

<!-- List any breaking changes and migration instructions. -->

- None

## Dependencies / Infrastructure

<!-- Notable dependency updates or infrastructure changes. -->

- 

## Known Issues

<!-- Known issues that are not fixed in this release. -->

- 

## Docker Image

The pre-built CI image is available from the GitHub Container Registry:

```
docker pull ghcr.io/Qobustan/latex-template-ci:<!-- VERSION -->
```

> **Note:** An image push to GHCR or Docker Hub requires the following
> repository secrets to be configured:
>
> | Secret | Purpose |
> |--------|---------|
> | `GHCR_USERNAME` | GitHub username authorised to push to `ghcr.io` |
> | `GHCR_TOKEN` | Personal access token (scope: `write:packages`) |
> | `DOCKERHUB_USERNAME` | Docker Hub username *(if using Docker Hub)* |
> | `DOCKERHUB_TOKEN` | Docker Hub access token *(if using Docker Hub)* |
>
> Alternatively, `GITHUB_TOKEN` can be used if the repository workflow
> permissions allow package writes.

## Local Test Commands

Build the image locally:

```bash
docker build -t latex-template-ci:local .
```

Compile a test document:

```bash
docker run --rm \
  -v "$(pwd)/test:/workdir" \
  -w /workdir \
  --entrypoint /bin/bash \
  latex-template-ci:local \
  -c "lualatex -interaction=nonstopmode minimal.tex && lualatex -interaction=nonstopmode minimal.tex"
```

## Files / Directories NOT Included in This Release

The following seminar-specific artefacts are intentionally excluded from this
repository and must **never** be committed:

| Path | Reason |
|------|--------|
| `Vortrag/` | Seminar presentation (content-specific) |
| `Ausarbeitung/` | Seminar written report (content-specific) |
| `Vortrag/img/` | Presentation images (content-specific) |
| `*.pdf` | Compiled PDFs (build artefacts) |
| `*.bib` | Bibliography files (content-specific) |
| Any secondary-draft files | Draft/working copies (content-specific) |

---

**Full diff:** https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/compare/<!-- PREV_TAG -->...<!-- VERSION -->
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
