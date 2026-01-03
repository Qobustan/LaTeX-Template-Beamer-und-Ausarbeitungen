# Beamer Presentation Template

This directory contains a professional Beamer presentation template.

## Quick Start

### 1. Customize Your Presentation

Edit `header.tex` to update metadata:
```latex
\author{Your Name}
\title{Your Presentation Title}
\subject{Your Subject}
\def \vorlesung {Your Course/Seminar Name}
\def \semester {Your Semester/Date}
\def \dozent {Your Professor/Advisor}
```

### 2. Edit Content

Open `Vortrag.tex` and replace the example content (marked with `BEISPIELINHALT`) with your own slides.

### 3. Update Bibliography

Edit `Vortrag.bib` to add your references.

### 4. Compile

**Using latexmk (recommended):**
```bash
latexmk -pdf Vortrag.tex
```

**Manual compilation:**
```bash
pdflatex -interaction=nonstopmode Vortrag.tex
bibtex Vortrag
pdflatex -interaction=nonstopmode Vortrag.tex
pdflatex -interaction=nonstopmode Vortrag.tex
```

## Features

- **Theme**: Madrid (easily customizable via `\usetheme{}`)
- **Language**: German (`ngerman`) - change to `english` if needed
- **Bibliography**: BibTeX with alphabetic style
- **Pause Control**: Toggle incremental reveals with `\pauseswitchtrue` or `\pauseswitchfalse`
- **Auto ToC**: Table of contents automatically shown at the start of each section
- **TikZ**: Full support for diagrams and graphics

## Customization

### Change Theme
```latex
\usetheme{Berlin}  % or Copenhagen, Singapore, etc.
```

### Change Language
```latex
\usepackage[english]{babel}  % instead of ngerman
```

### Disable Automatic Section ToC
Comment out the `\AtBeginSection[]` block in `Vortrag.tex`

## Example Content

The template includes example content about statistical methods (kernel density estimation). This serves as a reference for:
- Multiple sections and subsections
- TikZ diagrams
- Equations and mathematical notation
- Bibliography citations
- Pause commands for incremental reveals

**Remember to replace all example content with your own!**
