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
