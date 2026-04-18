#!/bin/bash
# sync-to-dotfiles.sh - Copy local config to dotfiles repo

REPO="$HOME/Documents/Projects/dotfiles"

echo "Syncing to dotfiles repo..."

cp -r ~/.config/hypr/* "$REPO/hypr/"
cp ~/.config/kitty/kitty.conf "$REPO/kitty/"
cp ~/.zshrc_aliases "$REPO/zsh/"
cp ~/.config/bat/config "$REPO/bat/"

sed -i "s/Updated on: [0-9-]*/Updated on: $(date +%Y-%m-%d)/" "$REPO/README.md"

echo "Done!"