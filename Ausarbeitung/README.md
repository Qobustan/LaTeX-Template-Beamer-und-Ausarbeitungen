# Written Elaboration Template

This directory contains a KOMA-Script article template for academic papers and written assignments.

## Quick Start

### 1. Customize Your Document

Edit `header.tex` to update metadata:
```latex
\author{Your Name}
\title{Your Document Title}
\subject{Your Subject}
\def \vorlesung {Your Course/Seminar Name}
\def \semester {Your Semester/Date}
\def \dozent {Your Professor/Advisor}
```

### 2. Edit Content

Open `Ausarbeitung.tex` and replace the example content (marked with `BEISPIELINHALT`) with your own text.

### 3. Update Bibliography

Edit `Ausarbeitung.bib` to add your references.

### 4. Compile

**Using latexmk (recommended):**
```bash
latexmk -pdf Ausarbeitung.tex
```

**Manual compilation:**
```bash
pdflatex -interaction=nonstopmode Ausarbeitung.tex
bibtex Ausarbeitung
pdflatex -interaction=nonstopmode Ausarbeitung.tex
pdflatex -interaction=nonstopmode Ausarbeitung.tex
```

## Features

- **Document Class**: KOMA-Script `scrartcl` (article format)
- **Language**: German (`ngerman`) - change to `english` if needed
- **Bibliography**: BibTeX with alphabetic style
- **Theorem Environments**: Pre-configured environments for theorems, lemmas, definitions, etc.
- **TikZ**: Full support for diagrams and graphics
- **Code Listings**: Support for pseudocode and syntax highlighting
- **Mathematics**: Comprehensive math packages (amsmath, amssymb, amsthm, etc.)

## Document Class Options

The template uses `scrartcl`. You can change it to:
```latex
\documentclass[a4paper, 11pt]{scrreprt}  % Report format
\documentclass[a4paper, 11pt]{scrbook}   % Book format
```

## Theorem Environments

Pre-configured German theorem environments:
- `theorem` - Theorem
- `satz` - Satz (Theorem)
- `lemma` - Lemma
- `korollar` - Korollar (Corollary)
- `definition` - Definition
- `beispiel` - Beispiel (Example)
- `bemerkung` - Bemerkung (Remark)
- `beweis` - Beweis (Proof)

Usage:
```latex
\begin{definition}
  Your definition here...
\end{definition}
```

## Customization

### Change Language
```latex
\usepackage[english]{babel}  % instead of ngerman
```

### Toggle Table of Contents
```latex
\showtexttrue   % Show ToC and bibliography
\showtextfalse  % Hide ToC and bibliography
```

### Custom Math Commands

The template includes shortcuts for common sets:
- `\N` - Natural numbers ℕ
- `\Z` - Integers ℤ
- `\Q` - Rational numbers ℚ
- `\R` - Real numbers ℝ
- `\eps` - Epsilon ε

## Example Content

The template includes example content about kernel density estimation. This serves as a reference for:
- Document structure with sections and subsections
- Mathematical equations and notation
- TikZ diagrams
- Bibliography citations
- Theorem environments

**Remember to replace all example content with your own!**
