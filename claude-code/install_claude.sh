#!/bin/bash
set -e

BIN_DIR="$HOME/.local/bin"
EXECUTABLE="$BIN_DIR/cl-internalize"
PROMPT_DIR="$HOME/.config/cl-internalize"
PROMPT_FILE="$PROMPT_DIR/prompt.md"

echo "Installing Claude Code Internalization Wrapper..."

mkdir -p "$BIN_DIR"
mkdir -p "$PROMPT_DIR"

# Copy the core prompt to a global location for Claude to read
cat "$(dirname "$0")/../core/internalize_prompt.md" > "$PROMPT_FILE"

# Create the wrapper script
cat << 'EOF' > "$EXECUTABLE"
#!/bin/bash
# Wrapper script for Claude Code to run an internalization session
echo "Starting Claude Code Internalization Session..."
claude -p "$HOME/.config/cl-internalize/prompt.md" "$@"
EOF

chmod +x "$EXECUTABLE"

echo "✅ Successfully installed 'cl-internalize' to $BIN_DIR"
echo "Ensure $BIN_DIR is in your PATH. You can now run 'cl-internalize' in any project directory."
