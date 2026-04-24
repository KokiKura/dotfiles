---
paths: dotfiles/dot_*
---

# Dotfiles Management (chezmoi)

Files managed by dotfiles (e.g., `~/.claude`, `~/.config`, files deployed by `chezmoi apply`) must not be edited directly at the root level. Always edit or create new files in the source directory `~/Repos/dotfiles/` first, then apply the changes.

1. Before editing any file, verify that the corresponding source file exists in `~/Repos/dotfiles/` and understand the chezmoi structure
2. Never edit files directly in the root directory; always edit or create files under `~/Repos/dotfiles/`
3. After editing, review the changes with `chezmoi diff`
4. If everything looks correct, execute `chezmoi apply`
5. After applying, verify that the changes are correctly reflected in the root directory files
