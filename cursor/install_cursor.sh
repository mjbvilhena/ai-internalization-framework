#!/bin/bash
set -e

TARGET_DIR="${1:-$(pwd)}"
CURSOR_FILE="$TARGET_DIR/.cursorrules"

echo "Installing Cursor Internalization Rule to $CURSOR_FILE..."

if [ -f "$CURSOR_FILE" ]; then
    echo "" >> "$CURSOR_FILE"
    echo "---" >> "$CURSOR_FILE"
fi

cat "$(dirname "$0")/.cursorrules-template" >> "$CURSOR_FILE"

echo "✅ Successfully installed. You can now use @internalize in Cursor in this workspace."
echo "Note: To install globally, you must manually paste the contents of .cursorrules-template into Cursor's Global Settings UI."
