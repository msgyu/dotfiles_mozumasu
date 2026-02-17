#!/usr/bin/env bash
set -euo pipefail

if [ "$(uname)" != "Darwin" ]; then
  echo "This script is only for macOS."
  exit 1
fi

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
REPO_URL="https://github.com/msgyu/dotfiles_mozumasu"

host_name="${NIX_HOSTNAME:-}"
if [ -z "$host_name" ]; then
  host_name="$(scutil --get LocalHostName 2>/dev/null || true)"
fi
if [ -z "$host_name" ]; then
  host_name="$(hostname -s 2>/dev/null || true)"
fi
if [ -z "$host_name" ]; then
  echo "Failed to determine host name. Set NIX_HOSTNAME." >&2
  exit 1
fi

if ! command -v nix >/dev/null 2>&1; then
  echo "Installing Nix..."
  sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
else
  echo "Nix is already installed."
fi

if [ ! -d "$DOTFILES_DIR/.git" ]; then
  echo "Cloning dotfiles into $DOTFILES_DIR..."
  git clone "$REPO_URL" "$DOTFILES_DIR"
else
  echo "Dotfiles already exist at $DOTFILES_DIR."
fi


if [ -f /etc/bashrc ] && [ ! -f /etc/bashrc.before-nix-darwin ]; then
  sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
fi

if [ -f /etc/zshrc ] && [ ! -f /etc/zshrc.before-nix-darwin ]; then
  sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
fi

sudo nix run \
  --extra-experimental-features nix-command \
  --extra-experimental-features flakes \
  nix-darwin -- switch --flake "$DOTFILES_DIR/.config/nix#$host_name"
