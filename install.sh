#!/usr/bin/env zsh
# dotfiles セットアップスクリプト
# 新しいマシンで dotfiles をセットアップするときに実行する

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "dotfiles: $DOTFILES_DIR"

# ~/.config 内のシンボリックリンクを作成（ディレクトリ単位）
CONFIG_DIRS=(claude ghostty nvim starship wezterm)

for dir in "${CONFIG_DIRS[@]}"; do
  src="$DOTFILES_DIR/.config/$dir"
  dst="$CONFIG_DIR/$dir"

  if [ ! -d "$src" ]; then
    echo "skip: $src が存在しません"
    continue
  fi

  if [ -L "$dst" ]; then
    echo "already linked: $dst"
  elif [ -e "$dst" ]; then
    echo "conflict: $dst が既に存在します（手動で確認してください）"
  else
    ln -s "$src" "$dst"
    echo "linked: $dst -> $src"
  fi
done

# ~/.zshrc
ZSHRC_SRC="$DOTFILES_DIR/.config/zsh/.zshrc"
ZSHRC_DST="$HOME/.zshrc"

if [ -L "$ZSHRC_DST" ]; then
  echo "already linked: $ZSHRC_DST"
elif [ -e "$ZSHRC_DST" ]; then
  echo "conflict: $ZSHRC_DST が既に存在します（手動で確認してください）"
else
  ln -s "$ZSHRC_SRC" "$ZSHRC_DST"
  echo "linked: $ZSHRC_DST -> $ZSHRC_SRC"
fi

echo "セットアップ完了"
