# Tmux
# Allow to have save the session of windows
echo "Installing tmux"
brew install tmux

# ZSH. 
# A better shell (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
echo "Installing zsh"
brew install zsh

# on-my-zsh.
# To have plugins
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zoxide 
# It's a better CD
echo "Installing zoxide"
brew install zoxide

# Lazygit
# Git for terminal
echo "Installing lazygit"
brew install lazygit

# Lazydocker
# Docker for terminal
echo "Installing lazydocker"
brew install lazydocker

# FZF
# Fuzzy finder for files. Integrates well with neovim telescope.
echo "Installing fzf"
brew install fzf
