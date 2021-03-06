# fix for unbearably slow git completion
__git_files () { 
  _wanted files expl 'local files' _files
}
fpath=($_FZFSH $fpath)
fpath=($ZSH/zsh/completion $fpath)
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

autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

source "$_FZFSH/completion.zsh"
source "$ZSH/zsh/aws_zsh_completer.sh"
