fpath=(/usr/share/fzf $fpath)
zstyle :compinstall filename ~/.zshrc
# case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# enable menu (eg tabbing through options)
zstyle ':completion:*' menu select
# when a character is ambiguous just select first (just tab through)
setopt menu_complete


#autoload -Uz git
zmodload zsh/complist
autoload -Uz compinit
compinit

source "/usr/share/fzf/completion.zsh"
