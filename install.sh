#!/bin/sh
# dotfiles bootstrap
# chezmoi をインストールして dotfiles を展開する

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)"
fi

chezmoi init --apply --source="$DOTFILES_DIR"
