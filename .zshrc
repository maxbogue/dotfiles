#!/bin/zsh

# Path fixes.
export PATH=/usr/local/bin:$PATH:/usr/local/mysql/bin:/usr/local/mongodb/bin:~/Library/Haskell/bin:~/Projects/norc/bin
export PYTHONPATH=$PYTHONPATH:~/Projects/:~/Projects/Lincoln
export SVN_EDITOR=vim
export DJANGO_SETTINGS_MODULE='django_config.settings'
export NORC_ENVIRONMENT='MaxEnv'
export NODE_PATH=$NODE_PATH:/usr/local/lib/node:/usr/local/lib/node_modules

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
export ZSH_THEME="maxbogue"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Uncomment this to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source ~/.aliases
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
