#!/bin/bash
set -e

# Global config path for Antigravity
AGY_GLOBAL_DIR="$HOME/.gemini/config/skills/internalize"

echo "Installing Antigravity (agy) Internalization Skill..."

# Create the directory
mkdir -p "$AGY_GLOBAL_DIR"

# Combine the SKILL.md and the core prompt into one file for the global install
# (Since the <include> tag might not resolve perfectly if paths change, we inject it directly)

cat << 'EOF' > "$AGY_GLOBAL_DIR/SKILL.md"
---
name: internalize
description: >-
  Use this skill to run an internalization session on a project, document, or codebase.
  It helps the user understand, map, and internalize AI-generated content through discovery,
  deconstruction, and Socratic interrogation. Works for any type of project (text, code, design).
---

# Internalization Skill

When the user asks to "internalize" a project, directory, file, or concept, apply the following protocol.

EOF

cat "$(dirname "$0")/../core/internalize_prompt.md" >> "$AGY_GLOBAL_DIR/SKILL.md"

echo "✅ Successfully installed 'internalize' skill to $AGY_GLOBAL_DIR/SKILL.md"
echo "You can now ask agy to 'internalize this project' in any workspace."
