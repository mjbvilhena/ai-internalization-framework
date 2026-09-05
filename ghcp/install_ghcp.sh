#!/bin/bash
set -e

TARGET_DIR="${1:-$(pwd)}"
GH_DIR="$TARGET_DIR/.github"
GHCP_FILE="$GH_DIR/copilot-instructions.md"

echo "Installing GitHub Copilot Internalization Instructions to $GHCP_FILE..."

mkdir -p "$GH_DIR"

if [ -f "$GHCP_FILE" ]; then
    echo "" >> "$GHCP_FILE"
    echo "---" >> "$GHCP_FILE"
fi

echo "# Internalization Protocol" >> "$GHCP_FILE"
echo "When the user asks to internalize the project, you must follow the instructions below." >> "$GHCP_FILE"
echo "" >> "$GHCP_FILE"

cat "$(dirname "$0")/../core/internalize_prompt.md" >> "$GHCP_FILE"

echo "✅ Successfully installed. You can now ask Copilot to internalize the project in this workspace."
