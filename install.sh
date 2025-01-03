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
