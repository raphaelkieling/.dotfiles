# Kieling Dotfiles

> Only UNIX-like systems are supported.

This project is a collection of my personal dotfiles. It is a work in progress and I am constantly updating it.

Configurations for:
- Neovim
- Zsh
- Ghostyy
- Tmux 

##  Installation

Before anything else, setup everything with:

```sh
# Tmux
# Allow to have save the session of windows
brew install tmux

# ZSH. 
# A better shell (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
brew install zsh

# on-my-zsh.
# To have plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zoxide 
# It's a better CD
brew install zoxide

# Lazygit
# Git for terminal
brew install lazygit

# Lazydocker
# Docker for terminal
brew install lazydocker

# FZF
# Fuzzy finder for files. Integrates well with neovim telescope.
brew install fzf
```

```sh
chmod +x ~/.dotfiles/install.sh
~/.dotfiles/install.sh
```
