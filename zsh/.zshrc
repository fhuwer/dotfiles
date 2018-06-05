# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(git docker zsh-syntax-highlighting ssh-agent)

source $ZSH/oh-my-zsh.sh

# Ignore duplicates in history
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# User configuration
CASE_SENSITIVE="true"
export VIRTUAL_ENV_DISABLE_PROMPT="true"
setopt nonomatch
setopt rmstarsilent

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Set colours
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi

# Load custom autocompletion if available
if [[ -d "$HOME/.zsh/completion" ]]; then
   fpath=(~/.zsh/completion $fpath)
   autoload -U compinit
   compinit
fi

# Source init script
[[ -a "$HOME/.zsh_init" ]] && source "$HOME/.zsh_init"

# Source aliases
source ~/.zsh_aliases
