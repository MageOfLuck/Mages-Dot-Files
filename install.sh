#!/bin/bash
set -e

echo "Installing packages..."
sudo pacman -S --needed - < packages.txt

echo "Stowing dotfiles..."
cd "$(dirname "$0")"
stow hypr wayle vicinae wezterm zsh local-bin