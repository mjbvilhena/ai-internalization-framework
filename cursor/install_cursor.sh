#!/bin/bash
set -e

if [[ -z "$1" ]] || [[ "$1" == "--global" ]]; then
    CURSOR_COMMANDS_DIR="$HOME/.cursor/commands"
    echo "Installing globally for Cursor..."
else
    TARGET_DIR="$1"
    CURSOR_COMMANDS_DIR="$TARGET_DIR/.cursor/commands"
    echo "Installing workspace-specifically to $TARGET_DIR..."
fi

COMMAND_FILE="$CURSOR_COMMANDS_DIR/internalize.md"

echo "Installing Cursor Internalization Command to $COMMAND_FILE..."
mkdir -p "$CURSOR_COMMANDS_DIR"

# Generate the frontmatter
cat << 'FRONTMATTER' > "$COMMAND_FILE"
---
description: Run the internalization protocol to understand and map the project
globs: *
name: internalize
---

FRONTMATTER

# Append the core prompt
cat "$(dirname "$0")/../core/internalize_prompt.md" >> "$COMMAND_FILE"

echo "✅ Successfully installed."
echo "You can now use /internalize in the Cursor Agent Chat."
