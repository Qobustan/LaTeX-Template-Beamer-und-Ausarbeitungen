#!/bin/bash

set -euo pipefail

# Help function
show_help() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS]

Remove temporary LaTeX build files from the repository.

OPTIONS:
    -h, --help      Show this help message and exit
    -q, --quiet     Suppress status output

DESCRIPTION:
    This script safely removes LaTeX temporary and auxiliary files from
    the current directory, Ausarbeitung, and Vortrag subdirectories.

    Files removed include:
    - Auxiliary files (.aux, .log, .toc, .lof, .lot, etc.)
    - Bibliography files (.bbl, .blg, .bcf, .run.xml)
    - Index files (.idx, .ind, .ilg, .ist)
    - Glossary files (.glo, .gls, .glg, .acn, .acr, .alg, etc.)
    - latexmk files (.fdb_latexmk, .fls)
    - Other temporary files (.out, .gz, .mw, .nav, .snm, .dvi)

EXAMPLE:
    ./Remove_Junk_Linux.sh
    ./Remove_Junk_Linux.sh --quiet

EOF
}

# Parse command line arguments
SHOW_COMMENTS=true
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -q|--quiet)
            SHOW_COMMENTS=false
            shift
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# File extensions to remove
EXTENSIONS="aux log lof gz toc bak~ bbl bcf blg lot out xml acn acr alg glg glo gls gug guo gus ist llg llo lls lug luo lus mog moo mos xdy mw nav snm fdb_latexmk fls idx ind ilg dvi run.xml"

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Helper: clean a directory
clean_dir() {
    local dir="$1"
    local label="$2"
    local count=0

    if [ ! -d "$dir" ]; then
        if [ "$SHOW_COMMENTS" = true ]; then
            echo "# Warning: $label directory not found, skipping"
        fi
        return
    fi

    if [ "$SHOW_COMMENTS" = true ]; then
        echo "# Cleaning temporary LaTeX files from $label directory"
    fi

    cd "$dir"
    for ext in $EXTENSIONS; do
        while IFS= read -r -d '' file; do
            rm -f "$file"
            count=$((count + 1))
        done < <(find . -maxdepth 1 -name "*.$ext" -type f -print0 2>/dev/null || true)
    done

    if [ "$SHOW_COMMENTS" = true ]; then
        echo "# Removed $count files from $label directory"
    fi

    echo $count
}

total=0

# Clean current directory
tmp=$(clean_dir "." "current")
total=$((total + tmp))

# Clean Ausarbeitung directory
tmp=$(clean_dir "$REPO_ROOT/Ausarbeitung" "Ausarbeitung")
total=$((total + tmp))

# Clean Vortrag directory
tmp=$(clean_dir "$REPO_ROOT/Vortrag" "Vortrag")
total=$((total + tmp))

echo ""
echo "=== Cleanup complete ==="
echo "Total files removed: $total"
