#!/bin/bash
# sync-from-dotfiles.sh - Copy dotfiles repo to local

REPO="$HOME/Documents/Projects/dotfiles"

echo "Syncing from dotfiles repo..."

rm -rf ~/.config/hypr && cp -r "$REPO/hypr" ~/.config/
rm ~/.config/kitty/kitty.conf && cp "$REPO/kitty/kitty.conf" ~/.config/kitty/
rm ~/.zshrc_aliases && cp "$REPO/zsh/.zshrc_aliases" ~/
rm ~/.config/bat/config && cp "$REPO/bat/config" ~/.config/bat/

echo "Done! Run: hyprctl reload"