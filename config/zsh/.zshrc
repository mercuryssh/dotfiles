# History in cache directory:
HISTSIZE=4444
SAVEHIST=4444
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
eval "$(starship init zsh)"
