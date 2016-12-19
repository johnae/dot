# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch banghist sharehistory hist_ignore_all_dups hist_ignore_space
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
fpath=(/usr/share/fzf $fpath)
zstyle :compinstall filename '/home/john/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"

alias home="GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME git"
alias vim=nvim
alias spotify="spotify --force-device-scale-factor=1.7"
PATH="$PATH:$HOME/Local/bin"

NDIRS=2
gitpwd() {
  local -a segs splitprefix; local prefix gitbranch
  segs=("${(Oas:/:)${(D)PWD}}")

  if gitprefix=$(git rev-parse --show-prefix 2>/dev/null); then
    splitprefix=("${(s:/:)gitprefix}")
    branch=$(git name-rev --name-only HEAD 2>/dev/null)
    if (( $#splitprefix > NDIRS )); then
      print -n "%F{green}${segs[$#splitprefix]}@$branch%f "
    else
      segs[$#splitprefix]+="@$branch"
    fi
  fi

  print "%F{green}${(j:/:)${(@Oa)segs[1,NDIRS]}}%f "
}

function cnprompt6 {
  case "$TERM" in
    xterm*|rxvt*)
      precmd() {  print -Pn "\e]0;%m: %~\a" }
      preexec() { printf "\e]0;$HOST: %s\a" $1 };;
  esac
  setopt PROMPT_SUBST
  PS1='%B%m%(?.. %??)%(1j. %j&.)%b $(gitpwd)%B%(!.%F{red}.%F{yellow})%#${SSH_CLIENT:+%#} %b'
  RPROMPT=''
}

cnprompt6
