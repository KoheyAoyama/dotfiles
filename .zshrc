# Keybinds like EMACS
bindkey -e


# Alias
alias g='git'
alias ll='ls -l'
alias la='ls -al'
alias md='mkdir'
alias rd='rm -r'
alias dk='docker'
alias dkc='docker-compose'
alias gb='gatsby'


# Export PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$PATH:/Users/aoyamakouhei/Library/flutter/bin"


# Some Config
export PS1="%~ %# "
autoload -Uz compinit && compinit
setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
setopt auto_cd
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history
export XDG_BASE_HOME='~/.config'
export DOCKER_CONTENT_TRUST=1

# Plugin management
# Git clone zplug if it not exists
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# Source zplug to use
source ~/.zplug/init.zsh

# Plugings
# zplug "username/reponame", tag
zplug "zsh-users/zsh-completions"
zplug "plugins/git",   from:oh-my-zsh
zplug "peterhurford/git-aliases.zsh"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# fzf
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# Common functions used in fzh
zplug "mollifier/anyframe"

# Rapid directly moving - Prediction search on fzf
zplug "b4b4r07/enhancd", use:init.sh

# Manage itself as plugin
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# Install plugins which doesn't exist.
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Add to PATH and source plugins
zplug load –verboseeval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aoyamakouhei/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/aoyamakouhei/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aoyamakouhei/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/aoyamakouhei/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
