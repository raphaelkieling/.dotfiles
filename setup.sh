#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
echo "$DOTFILES_DIR/nvim"

# Tmux
echo "Linking tmux..."
stow tmux -t $HOME

# Zsh
echo "Linking zshrc..."
stow zsh -t $HOME

# Neovim
echo "Linking nvim..."
stow neovim -t $HOME

# Ghostyy
echo "Linking ghostyy..."
stow ghostty -t $HOME

echo "Setup done"
