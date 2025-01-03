#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
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
cd $DOTFILES_DIR

echo "Copying custom conf"
echo "source-file $DOTFILES_DIR/tmux/.tmux.conf.local" >> "$HOME/.tmux.conf.local"

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
