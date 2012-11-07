#!/bin/zsh

# Path fixes.
export PATH=/usr/local/bin:$PATH:/usr/local/mysql/bin:/usr/local/mongodb/bin:~/Library/Haskell/bin:~/Projects/norc/bin
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:/usr/local/lib/python:$PYTHONPATH:~/Projects/:~/Projects/Lincoln
export SVN_EDITOR=vim
export DJANGO_SETTINGS_MODULE='django_config.settings'
export NORC_ENVIRONMENT='MaxEnv'
export NODE_PATH=$NODE_PATH:/usr/local/lib/node:/usr/local/lib/node_modules

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
export ZSH_THEME="maxbogue"

# virtualenvwrapper stuff.
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh >/dev/null 2>&1

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
