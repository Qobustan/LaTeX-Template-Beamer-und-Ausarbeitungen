#!/bin/bash

# Script to delete obsolete branches from the repository.
# Update OBSOLETE_BRANCHES below before running.
# List verified as of: 2026-03-01

set -e

# ──────────────────────────────────────────────────────────────────────────────
# Configuration – update these for your repository
# ──────────────────────────────────────────────────────────────────────────────

REPO_OWNER="Qobustan"
REPO_NAME="LaTeX-Template-Beamer-und-Ausarbeitungen"
REPO_FULL="${REPO_OWNER}/${REPO_NAME}"

echo "=================================="
echo "Obsolete Branch Cleanup Script"
echo "=================================="
echo ""
echo "Repository: ${REPO_FULL}"
echo ""
echo "The following branches will be KEPT:"
echo "  - main"
echo "  (Add any currently-open PR branches to this list)"
echo ""

# Function to delete a branch
delete_branch() {
    local branch_name="$1"
    echo "Deleting branch: $branch_name"
    if gh api -X DELETE "/repos/${REPO_FULL}/git/refs/heads/$branch_name" 2>/dev/null; then
        echo "  ✓ Successfully deleted: $branch_name"
    else
        echo "  ✗ Failed to delete: $branch_name (may not exist or insufficient permissions)"
    fi
}

# ──────────────────────────────────────────────────────────────────────────────
# Obsolete branches to delete – update this list before running
# ──────────────────────────────────────────────────────────────────────────────

# Example – replace with your actual obsolete branches:
OBSOLETE_BRANCHES=(
    # "feature/old-feature"
    # "copilot/completed-pr-branch"
)

if [ ${#OBSOLETE_BRANCHES[@]} -eq 0 ]; then
    echo "No obsolete branches configured. Edit this script to add branches."
    echo ""
    echo "To add branches, edit the OBSOLETE_BRANCHES array in this script."
    exit 0
fi

echo "The following branches will be DELETED (${#OBSOLETE_BRANCHES[@]} total):"
for branch in "${OBSOLETE_BRANCHES[@]}"; do
    echo "  - $branch"
done
echo ""

# Prompt for confirmation
read -p "Do you want to proceed with deleting these branches? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "Operation cancelled."
    exit 0
fi

echo ""
echo "Starting branch deletion..."
echo ""

for branch in "${OBSOLETE_BRANCHES[@]}"; do
    delete_branch "$branch"
done

echo ""
echo "=================================="
echo "Branch cleanup completed!"
echo "=================================="
echo ""
echo "To verify the cleanup, visit:"
echo "https://github.com/${REPO_FULL}/branches"
