#!/usr/bin/env bash
# Dotfiles install script — idempotent, safe to run multiple times.
# Coder will run this automatically when the dotfiles repo is configured.

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

link_file() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        ln -sf "$src" "$dest"
        echo "  updated symlink: $dest"
    elif [ -e "$dest" ]; then
        local backup="${dest}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$dest" "$backup"
        echo "  backed up existing: $dest -> $backup"
        ln -s "$src" "$dest"
        echo "  linked: $dest"
    else
        ln -s "$src" "$dest"
        echo "  linked: $dest"
    fi
}

link_file "$DOTFILES_DIR/.vimrc"     "$HOME/.vimrc"
link_file "$DOTFILES_DIR/.ideavimrc" "$HOME/.ideavimrc"
link_file "$DOTFILES_DIR/.inputrc"   "$HOME/.inputrc"
link_file "$DOTFILES_DIR/tmux.conf"  "$HOME/.tmux.conf"

# Source bashrc_tpreece from ~/.bashrc without replacing it.
# This preserves Coder's default bashrc while adding custom aliases/functions.
SOURCE_LINE="source \"$DOTFILES_DIR/bashrc_tpreece\""
BASHRC="$HOME/.bashrc"

if grep -qF "bashrc_tpreece" "$BASHRC" 2>/dev/null; then
    echo "  bashrc_tpreece already sourced in $BASHRC — skipping"
else
    printf '\n# Custom aliases and functions\n%s\n' "$SOURCE_LINE" >> "$BASHRC"
    echo "  added source line to $BASHRC"
fi

echo "Done."
