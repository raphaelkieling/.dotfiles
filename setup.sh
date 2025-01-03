#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
echo "$DOTFILES_DIR/nvim"

# Tmux
echo "Removing tmux..."
rm -Rf "$HOME/.tmux"
rm -Rf "$HOME/.tmux.conf"
rm -Rf "$HOME/.tmux.conf.local"

# Install .tmux
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
stow ghostyy -t $HOME

echo "Setup done"
