#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_DIR=$(realpath "$DOTFILES_DIR")
echo "$DOTFILES_DIR/nvim"

# Tmux
rm -Rf "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Zsh
rm -Rf "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Neovim
echo "Removing nvim..."
rm -Rf "$HOME/.config/nvim"
ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "Configurações vinculadas com sucesso!"
