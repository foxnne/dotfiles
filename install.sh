#!/usr/bin/env bash
# Symlinks dotfiles from ~/.dotfiles into their expected locations.
# Safe to re-run: existing real files are backed up; existing correct symlinks are left alone.

set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

link() {
  local src="$1" dst="$2"

  if [ ! -e "$src" ]; then
    echo "skip: source missing $src"
    return
  fi

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ]; then
    if [ "$(readlink "$dst")" = "$src" ]; then
      echo "ok:   $dst"
      return
    fi
    rm "$dst"
  elif [ -e "$dst" ]; then
    local backup="$dst.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "back: $dst -> $backup"
  fi

  ln -s "$src" "$dst"
  echo "link: $dst -> $src"
}

link "$DOTFILES/.zshrc"            "$HOME/.zshrc"
link "$DOTFILES/.gitconfig"        "$HOME/.gitconfig"
link "$DOTFILES/jj/config.toml"    "$HOME/.config/jj/config.toml"
link "$DOTFILES/cursor/settings.json"    "$HOME/Library/Application Support/Cursor/User/settings.json"
link "$DOTFILES/cursor/keybindings.json" "$HOME/Library/Application Support/Cursor/User/keybindings.json"

echo "done."
