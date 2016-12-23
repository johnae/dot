fpath=(/usr/share/fzf $fpath)
zstyle :compinstall filename ~/.zshrc

#autoload -Uz git
zmodload zsh/complist
autoload -Uz compinit
compinit

source "/usr/share/fzf/completion.zsh"
