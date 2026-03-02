#!/bin/bash
# Script to generate PDFs for Ausarbeitung and Vortrag

set -euo pipefail

# Help function
show_help() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS]

Generate PDFs for Ausarbeitung and Vortrag using pdflatex or lualatex.

OPTIONS:
    -h, --help              Show this help message and exit
    -e, --engine ENGINE     LaTeX engine to use: pdflatex (default) or lualatex

DESCRIPTION:
    This script compiles LaTeX documents in the Ausarbeitung and Vortrag
    directories. It runs the specified LaTeX engine three times and biber/bibtex
    once for each document to ensure all references and cross-references are
    resolved.

    The engine can also be set via the LATEX_ENGINE environment variable:
        export LATEX_ENGINE=lualatex
        ./generatePdf.sh

REQUIREMENTS:
    - pdflatex or lualatex (from a TeX distribution)
    - bibtex or biber (from a TeX distribution)

EXAMPLES:
    ./generatePdf.sh
    ./generatePdf.sh --engine lualatex
    LATEX_ENGINE=lualatex ./generatePdf.sh

EOF
}

# Parse command line arguments
ENGINE="${LATEX_ENGINE:-pdflatex}"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -e|--engine)
            ENGINE="${2:-}"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Validate engine choice
if [[ "$ENGINE" != "pdflatex" && "$ENGINE" != "lualatex" ]]; then
    echo "Error: Unsupported engine '$ENGINE'. Use 'pdflatex' or 'lualatex'."
    exit 1
fi

# Check if required tools are installed
if ! command -v "$ENGINE" &> /dev/null; then
    echo "Error: $ENGINE is not installed or not in PATH"
    echo "Please install a TeX distribution (e.g., TeX Live, MiKTeX)"
    exit 1
fi

if ! command -v bibtex &> /dev/null && ! command -v biber &> /dev/null; then
    echo "Error: Neither bibtex nor biber is installed or not in PATH"
    echo "Please install a TeX distribution (e.g., TeX Live, MiKTeX)"
    exit 1
fi

# Use biber if available, otherwise fall back to bibtex
BIB_TOOL="bibtex"
if command -v biber &> /dev/null; then
    BIB_TOOL="biber"
fi

echo "=== PDF Generation Script ==="
echo "Engine:  $ENGINE"
echo "BibTool: $BIB_TOOL"
echo ""

# Helper: compile a single LaTeX document
compile_document() {
    local doc_dir="$1"
    local doc_name="$2"
    local doc_label="$3"

    echo "[${doc_label}] Building ${doc_name}..."
    cd "$doc_dir"

    echo "  Step 1/4: Running ${ENGINE} (first pass)..."
    "$ENGINE" -interaction=nonstopmode "${doc_name}.tex" > /dev/null

    echo "  Step 2/4: Running ${BIB_TOOL}..."
    "$BIB_TOOL" "${doc_name}" > /dev/null 2>&1 || true

    echo "  Step 3/4: Running ${ENGINE} (second pass)..."
    "$ENGINE" -interaction=nonstopmode "${doc_name}.tex" > /dev/null

    echo "  Step 4/4: Running ${ENGINE} (third pass)..."
    "$ENGINE" -interaction=nonstopmode "${doc_name}.tex" > /dev/null

    if [[ -f "${doc_name}.pdf" ]]; then
        local size
        size=$(du -h "${doc_name}.pdf" | cut -f1)
        echo "  ✓ ${doc_name}.pdf generated successfully (size: ${size})"
    else
        echo "  ✗ Error: ${doc_name}.pdf was not generated"
        exit 1
    fi
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Build Ausarbeitung
compile_document "${REPO_ROOT}/Ausarbeitung" "Ausarbeitung" "1/2"

echo ""

# Build Vortrag
compile_document "${REPO_ROOT}/Vortrag" "Vortrag" "2/2"

echo ""
echo "=== All PDFs generated successfully! ==="