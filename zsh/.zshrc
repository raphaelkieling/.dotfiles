# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)
plugins+=(zsh-npm-scripts-autocomplete)

source $ZSH/oh-my-zsh.sh

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration ------------------------------------

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Path stuff
export PATH=/usr/local/bin:$PATH
export PATH=$DOTFILES/bin:$PATH

# Added zoxide. A better cd tool
eval "$(zoxide init --cmd cd zsh)"

# Add eza. Better ls
alias ls='eza -al --icons --group-directories-first --color=auto --git'

DOTFILES="$HOME/.dotfiles"

# Add bat as the default `cat` replacement
if command -v batcat >/dev/null 2>&1; then
  alias rcat="$(which cat)"
  alias cat="$(which batcat)"
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  export MANROFFOPT="-c"
elif command -v bat >/dev/null 2>&1; then
  alias rcat="$(which cat)"
  alias cat="$(which bat)"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
fi

# TMUX
# if [ -z "$TMUX" ]
# then
#     tmux attach -t TMUX || tmux new -s TMUX -c "$PWD"
# fi

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load the default Node.js version silently
# nvm use 20 --silent

# Theme for bat
export BAT_THEME="Dracula"

# Alias
alias n="nvim"
alias nc="nvim $HOME/.dotfiles"
alias lg="lazygit"
alias ld="lazydocker"

# Cheat.sh
cheatsh() {
    curl cheat.sh/"$1"
}

# Docker stop
dockerstop() {
	docker stop $(docker ps -a -q)
}

# Created by `pipx` on 2025-01-03 21:01:34
export PATH="$PATH:/Users/kieling/.local/bin"

# Added Atuin. Better history
eval "$(atuin init zsh)"
