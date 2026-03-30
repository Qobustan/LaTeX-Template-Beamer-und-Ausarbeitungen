#!/bin/bash
# SPDX-License-Identifier: MIT
# Bidirectional Repository Synchronization Script
# Syncs genusine template files between LaTeX-Template and Seminar repos
# Respects content-specific boundaries (template stays separate from seminar content)

set -euo pipefail

TEMPLATE_REPO="Qobustan/LaTeX-Template-Beamer-und-Ausarbeitungen"
SEMINAR_REPO="Qobustan/Seminar-Angewandte-Statistik-2025"

# Synchronized directories (Template -> Seminar)
SYNC_DIRS=(
  ".github/workflows"
  "scripts"
  "cleanup"
  "task_skripts"
  "docs"
  ".editorconfig"
  ".gitignore"
  "cspell.json"
)

# Content-specific files (NOT synced - stay separate)
CONTENT_ONLY=(
  "Ausarbeitung/Ausarbeitung.tex"
  "Ausarbeitung/Ausarbeitung.bib"
  "Vortrag/Vortrag.tex"
  "Vortrag/Vortrag.bib"
  "Vortrag/img/*"
)

echo "🔄 Bidirectional Repository Synchronization"
echo "=========================================="
echo "Template: $TEMPLATE_REPO"
echo "Seminar:  $SEMINAR_REPO"
