#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration ------------------------------------

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Added zoxide. A better cd tool
eval "$(zoxide init --cmd cd zsh)"

DOTFILES="$HOME/.dotfiles"

# Path stuff
export PATH=/usr/local/bin:$PATH
export PATH=$DOTFILES/bin:$PATH
