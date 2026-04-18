# dotfiles

Minimal and modular Linux configuration focused on a clean, keyboard-driven workflow. Built around Hyprland, blending performance, simplicity, and a touch of visual polish.

Updated on: 2026-04-18

## Overview

- **Compositor**: Hyprland (Wayland)
- **Terminal**: Kitty with transparency and blur
- **Shell**: Zsh with custom aliases
- **Cursor**: ComixCursors (white)
- **Wallpaper**: swaybg

## Structure

```
dotfiles/
├── bat/                 → bat configuration
├── hypr/                → Hyprland config (modular)
├── kitty/              → Terminal config
├── zsh/                → Shell aliases
├── sync-to-dotfiles.sh
├── sync-from-dotfiles.sh
└── README.md
```

## Requirements

- Hyprland
- Kitty
- bat (or batcat on Debian)
- lsd
- swaybg
- [ComixCursors](https://gitlab.com/limitland/comixcursors) - cursor theme (not included)

## Installation

```bash
# Clone
git clone https://github.com/youruser/dotfiles.git ~/dotfiles

# Copy
cp -r ~/dotfiles/hypr ~/.config/
cp ~/dotfiles/kitty/kitty.conf ~/.config/kitty/
cp ~/dotfiles/zsh/.zshrc_aliases ~/
cp ~/dotfiles/bat/config ~/.config/bat/
```

## Sync Scripts

- `sync-to-dotfiles.sh`   - copy local → repo
- `sync-from-dotfiles.sh` - copy repo → local

## Git

```bash
cd ~/Documents/Projects/dotfiles
git add .
git commit -m "Update date +%Y-%m-%d"
```

Source aliases from `.zshrc`:
```bash
[ -f ~/.zshrc_aliases ] && source ~/.zshrc_aliases
```

## Keybindings

| Binding | Action |
|---------|--------|
| `SUPER + Q` | Close window |
| `SUPER + D` | App launcher |

## Private Config

Private data in `~/.zshrc_private` (not in repo).

## Secrets Scan

GitHub Actions workflow at `.github/workflows/secrets-scan.yml`.