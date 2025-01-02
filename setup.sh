#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_DIR=$(realpath "$DOTFILES_DIR")
echo "$DOTFILES_DIR/nvim"

# Tmux
echo "Removing tmux..."
rm -Rf "$HOME/.tmux"
rm -Rf "$HOME/.tmux.conf"
rm -Rf "$HOME/.tmux.conf.local"

# Install .tmux
echo "Setting up .tmux"
cd $HOME
git clone --single-branch https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "Copying custom conf"
echo "source-file $DOTFILES_DIR/tmux/.tmux.conf.local" >> "$HOME/.tmux.conf.local"

# Zsh
echo "Removing zshrc..."
rm -Rf "$HOME/.zshrc"

echo "Linking zshrc..."
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Neovim
echo "Removing nvim..."
rm -Rf "$HOME/.config/nvim"

echo "Linking nvim..."
ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "Removing current ghostyy"
rm -Rf "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/ghostty"
echo "Adding config for ghostyy"
ln -sf "$DOTFILES_DIR/ghostyy/config" "$HOME/.config/ghostty/config"

echo "Setup done"
