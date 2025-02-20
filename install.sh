# Fastfetch
# See the system information in a better way
brew install fastfetch

# Entr
# Entr is a utility for running arbitrary commands when files change.
brew install entr

# Btop
# Better top
brew install btop

# Nvim
brew install nvim

# Slides.
# Allow to run md files as slides
brew install slides

# TLDR. Better man
brew install tlrc

# Font
brew install --cask font-fira-code-nerd-font

# Install ripgrep to be able to filter .gitignore on Telescope
brew install ripgrep

# Languages
brew install nodejs golang rust

# Stow
# Responsible for managing symlinks
brew install stow

# Tmux
# Allow to have save the session of windows
brew install tmux

# use tmux TPM (plugin manager)
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "TPM already installed"
else
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# ZSH. 
# A better shell (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
brew install zsh zsh-autosuggestions zsh-syntax-highlighting

# on-my-zsh.
# To have plugins
# Check
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh already installed"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Npm zsh auto complete
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-npm-scripts-autocomplete" ]; then
  echo "zsh-npm-scripts-autocomplete already installed"
else
  git clone git@github.com:grigorii-zander/zsh-npm-scripts-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-npm-scripts-autocomplete
fi

# Zoxide 
# It's a better CD
brew install zoxide

# Lazygit
# Git for terminal
brew install lazygit

# Lazydocker
# Docker for terminal
brew install lazydocker

# C++ for tools
brew install gcc make

# FZF
# Fuzzy finder for files. Integrates well with neovim telescope.
brew install fzf rg fd

# NVM
brew install nvm

# BAT
# better cat
brew install bat

# Ghoosty
# Terminal
brew install --cask ghostty
