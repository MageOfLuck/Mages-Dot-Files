#!/usr/bin/env bash
#
# setup.sh
# Usage: ./setup.sh
# Re-run safe: skips steps that are already done.

set -euo pipefail

# ---------- helpers ----------
info()  { echo -e "\e[1;34m[*]\e[0m $*"; }
ok()    { echo -e "\e[1;32m[✓]\e[0m $*"; }
warn()  { echo -e "\e[1;33m[!]\e[0m $*"; }

AUR_HELPER=""
if command -v paru &>/dev/null; then
    AUR_HELPER="paru"
elif command -v yay &>/dev/null; then
    AUR_HELPER="yay"
fi

# ---------- 1. install zsh + plugins ----------
info "Installing zsh and companion packages..."
sudo pacman -S --needed --noconfirm \
    zsh \
    zsh-completions \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    starship \
    fzf \
    eza \
    bat

ok "Packages installed."

# ---------- 2. set zsh as default shell ----------
if [[ "$SHELL" != *zsh ]]; then
    info "Setting zsh as your default shell (you'll be prompted for your password)..."
    chsh -s "$(command -v zsh)"
    ok "Default shell changed to zsh. This takes effect on your next login."
else
    ok "zsh is already your default shell."
fi

# ---------- 3. baseline .zshrc (only if none exists) ----------
ZSHRC="$HOME/.zshrc"
if [[ ! -f "$ZSHRC" ]]; then
    info "No .zshrc found, writing a baseline one..."
    cat > "$ZSHRC" <<'EOF'
# ---- history ----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# ---- completion ----
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# ---- plugins (from pacman packages) ----
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- prompt ----
eval "$(starship init zsh)"

# ---- aliases ----
alias ls='eza --icons'
alias ll='eza -l --icons'
alias cat='bat'
alias pacs='pacman -Ss'
alias update='sudo pacman -Syu'
EOF
    ok "Baseline .zshrc written to $ZSHRC"
else
    warn ".zshrc already exists, leaving it untouched. Merge the snippets above manually if you want them."
fi

# ---------- 4. starship config (Catppuccin Mocha preset) ----------
STARSHIP_CONFIG_DIR="$HOME/.config"
mkdir -p "$STARSHIP_CONFIG_DIR"
if [[ ! -f "$STARSHIP_CONFIG_DIR/starship.toml" ]]; then
    info "Applying Catppuccin Mocha preset to starship..."
    starship preset catppuccin-powerline -o "$STARSHIP_CONFIG_DIR/starship.toml"
    ok "starship.toml written with Catppuccin Mocha preset."
else
    warn "starship.toml already exists, skipping preset."
fi

# ---------- 5. optional: pull in dotfiles via GNU Stow ----------
# Uncomment and edit this block if you want the script to also clone
# your Mages-Dot-Files repo and stow the zsh package into place.
#
# DOTFILES_DIR="$HOME/.dotfiles"
# if [[ ! -d "$DOTFILES_DIR" ]]; then
#     info "Cloning dotfiles repo..."
#     sudo pacman -S --needed --noconfirm stow git
#     git clone git@github.com:MageOfLuck/Mages-Dot-Files.git "$DOTFILES_DIR"
#     cd "$DOTFILES_DIR"
#     stow zsh
#     ok "Dotfiles cloned and zsh package stowed."
# else
#     warn "Dotfiles dir already exists at $DOTFILES_DIR, skipping clone."
# fi

echo
ok "Done. Log out and back in (or reboot) for the shell change to fully apply."
[[ -n "$AUR_HELPER" ]] && info "Detected AUR helper: $AUR_HELPER (not used by this script, but available if you want AUR zsh plugins later)."