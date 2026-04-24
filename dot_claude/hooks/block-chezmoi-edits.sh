#!/bin/bash
# Block direct editing of chezmoi-managed dotfiles

file_path=$(jq -r '.tool_input.file_path // .tool_input.path')
expanded=$(eval echo "$file_path" 2>/dev/null || echo "$file_path")

if [[ "$expanded" == /Users/kokikuramoto/.claude/* ]] || [[ "$expanded" == /Users/kokikuramoto/.config/* ]]; then
  rm -f "$expanded"
  cat <<'EOF'
{"continue":true,"systemMessage":"Blocked: Cannot edit chezmoi-managed dotfiles directly.\nSee ~/.claude/rules/dotfiles.md for details and workflow."}
EOF
fi
