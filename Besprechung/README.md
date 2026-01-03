# Meeting and Discussion Templates

This directory contains LaTeX template variants optimized for meetings, discussions, and collaborative work sessions.

## Overview

The `Besprechung/` directory provides alternative versions of the main templates (Ausarbeitung and Vortrag) that can be adapted for:
- Meeting notes and minutes
- Discussion documentation
- Collaborative work sessions
- Group presentations and reports

## Directory Structure

```
Besprechung/
└── Material/
    ├── Ausarbeitung/   # Written elaboration variant
    └── Vortrag/        # Beamer presentation variant
```

## Quick Start

### Using the Written Elaboration Template

Navigate to `Material/Ausarbeitung/` for a document template suitable for meeting notes and written discussions.

**To customize:**
1. Edit `header.tex` to update metadata (author, title, course, etc.)
2. Edit `Ausarbeitung.tex` to add your content
3. Edit `Ausarbeitung.bib` for references
4. Compile the document

**Compile with latexmk (recommended):**
```bash
cd Material/Ausarbeitung
latexmk -pdf Ausarbeitung.tex
```

**Manual compilation:**
```bash
cd Material/Ausarbeitung
pdflatex -interaction=nonstopmode Ausarbeitung.tex
bibtex Ausarbeitung
pdflatex -interaction=nonstopmode Ausarbeitung.tex
pdflatex -interaction=nonstopmode Ausarbeitung.tex
```

### Using the Beamer Presentation Template

Navigate to `Material/Vortrag/` for a presentation template suitable for collaborative presentations.

**To customize:**
1. Edit `header.tex` to update metadata (author, title, course, etc.)
2. Edit `Vortrag.tex` to add your slides
3. Edit `Vortrag.bib` for references
4. Compile the document

**Compile with latexmk (recommended):**
```bash
cd Material/Vortrag
latexmk -pdf Vortrag.tex
```

**Manual compilation:**
```bash
cd Material/Vortrag
pdflatex -interaction=nonstopmode Vortrag.tex
bibtex Vortrag
pdflatex -interaction=nonstopmode Vortrag.tex
pdflatex -interaction=nonstopmode Vortrag.tex
```

## Template Features

Both templates include:

### Written Elaboration (`Material/Ausarbeitung/`)
- **Document Class**: KOMA-Script `scrartcl` (article format)
- **Language**: German (`ngerman`) - easily changed to English
- **Bibliography**: BibTeX with alphabetic style
- **Theorem Environments**: Pre-configured for mathematical content
- **TikZ Support**: Full diagram and graphics capabilities
- **Mathematics**: Comprehensive math packages
- **Customizable**: Toggle table of contents and bibliography

### Beamer Presentation (`Material/Vortrag/`)
- **Theme**: Madrid (easily customizable)
- **Language**: German (`ngerman`) - easily changed to English
- **Bibliography**: BibTeX with alphabetic style
- **Pause Control**: Toggle incremental reveals
- **Auto ToC**: Automatic table of contents at section starts
- **TikZ Support**: Full diagram and graphics capabilities

## Use Cases

These templates are particularly useful for:

### Meeting Documentation
- Record discussion points and decisions
- Document collaborative work sessions
- Create structured meeting minutes
- Track action items and follow-ups

### Group Presentations
- Collaborative presentation development
- Team-based seminar presentations
- Discussion-focused slide decks
- Interactive presentation sessions

### Discussion Materials
- Prepare materials for group discussions
- Document brainstorming sessions
- Create handouts for meetings
- Structured note-taking templates

## Customization Tips

### Change Language to English
```latex
\usepackage[english]{babel}  % instead of ngerman
```

### Modify Document Metadata
Edit the `header.tex` file in either template:
```latex
\author{Your Name}
\title{Your Document Title}
\subject{Your Subject}
\def \vorlesung {Your Course/Meeting Name}
\def \semester {Date/Semester}
\def \dozent {Organizer/Facilitator}
```

### Beamer Theme Options
Change the presentation theme in `Vortrag.tex`:
```latex
\usetheme{Berlin}     % or Copenhagen, Singapore, Warsaw, etc.
```

## Relationship to Main Templates

The templates in `Besprechung/Material/` are variants of the main templates found in:
- **Main Written Elaboration**: `../../Ausarbeitung/`
- **Main Beamer Presentation**: `../../Vortrag/`

These variants maintain the same structure and features but can be customized independently for meeting-specific needs without affecting the main templates.

## Additional Resources

For more detailed information about LaTeX compilation, features, and customization:
- [Main Project README](../../README.md)
- [Ausarbeitung Template Documentation](../../Ausarbeitung/README.md)
- [Vortrag Template Documentation](../../Vortrag/README.md)
- [Project Wiki](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki)

## Cleanup

After compilation, temporary LaTeX files (`.aux`, `.log`, `.toc`, etc.) can be removed using the cleanup scripts in the repository root:

**Linux/macOS:**
```bash
../../cleanup/Remove_Junk_Linux.sh
```

**Windows:**
```batch
..\..\cleanup\Remove_Junk_Windows.bat
```

## Support

For questions, issues, or contributions, please refer to:
- [Contributing Guidelines](../../CONTRIBUTING.md)
- [Project Issues](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/issues)
- [Project Wiki](https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen/wiki)
