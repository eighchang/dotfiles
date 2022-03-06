# PATH
PATH="/opt/homebrew/opt/node@14/bin:$PATH"

eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# completion
autoload -U compinit
compinit -u

# beep
setopt nolistbeep

# prompt
PROMPT='%m:%c %n$ '

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# zplug ------------------------------------
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# pure
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# history search
zplug "zsh-users/zsh-history-substring-search"

# completion
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# install
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
# ------------------------------------------

# alias
alias ls='exa --icons'
alias ll='exa -alh --icons'
alias cat='bat'
alias diff="coloddiff"

alias brew="PATH=/opt/homebrew/bin brew"
