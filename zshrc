source ~/.aliases

# Path fixes.
export PATH=$HOME/.dotfiles/bin:$HOME/.cabal/bin:node_modules/.bin:/usr/local/bin:/usr/local/opt/ruby/bin:$HOME/dev/ml-environment/bin:$HOME/.local/bin:$PATH
export MLE_USER=max.bogue
export MLE_SLACK_USER=max.bogue

# ls coloring
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
if [ "$DISABLE_LS_COLORS" != "true" ]; then
    # Find the option for using colors in ls (Linux vs BSD).
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty -1' || alias ls='ls -G -1'
fi

# virtualenvwrapper stuff.
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh >/dev/null 2>&1

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# Completion

unsetopt menu_complete      # Tab cycles through completions.
setopt auto_menu            # Require a second tab for menu behavior.
setopt complete_in_word     # Can complete from the middle of a word.
setopt always_to_end        # Move cursor to end even from middle.
# Case insensitive completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Use the LS_COLORS colors in completions.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Fuzzy matching!
zstyle ':completion:*' completer _complete _match _approximate
# If there's already a *, only expand it and not at the cursor.
zstyle ':completion:*:match:*' original only
# Highlight the currently selected completion.
zstyle ':completion:*:*:*:*:*' menu select

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/max.bogue/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
export JAVA_OPTS=-Djna.library.path=$(echo $(brew --cellar c-blosc)/*/lib/)
