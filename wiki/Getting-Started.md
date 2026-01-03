# Getting Started

This guide will help you get started with using the LaTeX template for your presentations and written documents.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Git**: For cloning and version control
- **LaTeX Distribution**: TeX Live (Linux/Windows) or MacTeX (macOS)
- **LaTeX Editor** (optional but recommended): TeXstudio, VS Code with LaTeX Workshop, or your preferred editor

For detailed LaTeX installation instructions, see:
- [LaTeX Installation Guide (English)](../latex_install/LaTeX-Install.md)
- [LaTeX Installation Guide (German)](../latex_install/LaTeX-Install.de.md)

## Quick Start

### 1. Clone or Fork the Repository

```bash
git clone https://github.com/Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen.git
cd LaTeX-Template-Beamer-und-Ausarbeitungen
```

Or fork the repository on GitHub to create your own copy.

### 2. Choose Your Template

The repository provides two main templates:

- **`Vortrag/`** - Beamer presentation template (see `Vortrag/README.md`)
- **`Ausarbeitung/`** - Written elaboration template (see `Ausarbeitung/README.md`)

### 3. Customize the Template

#### For a Presentation:

1. Navigate to `Vortrag/`
2. Edit `header.tex` to update your personal metadata
3. Edit `Vortrag.tex` and replace the example content with your own
4. Update `Vortrag.bib` with your references

#### For a Written Document:

1. Navigate to `Ausarbeitung/`
2. Edit `header.tex` to update your personal metadata
3. Edit `Ausarbeitung.tex` and replace the example content with your own
4. Update `Ausarbeitung.bib` with your references

### 4. Build PDFs Locally

#### Option A: Using latexmk (Recommended)

```bash
# Build the presentation
cd Vortrag
latexmk -pdf Vortrag.tex

# Build the elaboration
cd ../Ausarbeitung
latexmk -pdf Ausarbeitung.tex
```

#### Option B: Using Scripts

```bash
# Build all PDFs
./scripts/generatePdf.sh
```

#### Option C: Using Docker

```bash
# Build using Docker
docker build -t latex-template .
docker run --rm -v $(pwd):/app latex-template
```

#### Option D: Manual Compilation

```bash
# For any document
pdflatex -interaction=nonstopmode YourDocument.tex
bibtex YourDocument
pdflatex -interaction=nonstopmode YourDocument.tex
pdflatex -interaction=nonstopmode YourDocument.tex
```

### 5. Customize Further

- **Change Language**: Edit `\usepackage[ngerman]{babel}` to `\usepackage[english]{babel}`
- **Change Theme** (Presentations): Edit `\usetheme{Madrid}` to another Beamer theme
- **Change Document Class** (Papers): Edit `\documentclass[a4paper, 11pt]{scrartcl}` to `scrreprt` or `scrbook`

### 6. Version Control (Optional)

If you're working on your own project:

1. Create a new branch for your work:
   ```bash
   git checkout -b my-presentation
   ```

2. Make your changes and commit:
   ```bash
   git add .
   git commit -m "Customized template for my presentation"
   ```

3. Push your changes:
   ```bash
   git push origin my-presentation
   ```

### 7. Automated CI/CD

If you push to GitHub, the CI/CD workflows will automatically build your PDFs. See [CI/CD Workflows](CI-CD-Workflows.md) for more details.

## Template Features

### Beamer Presentation (`Vortrag/`)

- Madrid theme (easily customizable)
- Automatic table of contents at section starts
- TikZ support for diagrams
- Bibliography support
- Pause commands for incremental reveals
- Example content showing best practices

### Written Elaboration (`Ausarbeitung/`)

- KOMA-Script article class
- Comprehensive theorem environments
- Mathematics support (amsmath, amssymb, etc.)
- TikZ diagrams
- Code listing support
- Bibliography management
- Example content showing best practices

## Editor Configuration

### TeXstudio Setup

After installing TeXstudio:

**Options** → **Configure TeXstudio** → **Build** → **Default Bibliography Tool: BibTeX** (or Biber)

### Visual Studio Code

If using VS Code, install the LaTeX Workshop extension and create `.vscode/settings.json`:

```json
{
  "latex-workshop.latex.autoBuild.run": "never",
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": ["-pdf", "-interaction=nonstopmode", "%DOC%"]
    }
  ]
}
```

## Next Steps

- Review the [Project Structure](Project-Structure.md) for detailed organization
- Read the [Building PDFs](Building-PDFs.md) guide for advanced build options
- Check the per-directory README files (`Vortrag/README.md`, `Ausarbeitung/README.md`)
- Browse the [FAQ](FAQ.md) for common questions

## Getting Help

If you run into issues:

1. Check the [Troubleshooting Guide](Troubleshooting.md)
2. Review the [FAQ](FAQ.md)
3. Create an issue on GitHub using our templates

---

[← Back to Wiki Home](Home.md)
