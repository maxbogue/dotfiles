source ~/.aliases

# Path fixes.
export PATH=/usr/local/bin:$PATH

# virtualenvwrapper stuff.
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh >/dev/null 2>&1

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# completion
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3 + 1))numeric)'
zstyle ':completion:*:*:*:*:*' menu select

# correction
unsetopt correct_all

# ls coloring
export LSCOLORS="Gxfxcxdxbxegedabagacad"
if [ "$DISABLE_LS_COLORS" != "true" ]; then
    # Find the option for using colors in ls (Linux vs BSD).
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt extended_history
setopt hist_verify

# prompt
if [ -f ~/.boxprefs ]; then
    source ~/.boxprefs
else
    BOXNAME=`hostname -s`
    COLOR=%{$fg[white]%}
fi
if [ $TERM = 'dumb' ]; then
    PS1="%n@$BOXNAME %c $ "
else
    PS1="$COLOR%n@$BOXNAME %{$reset_color%}%c$COLOR $%{$reset_color%} "
fi
