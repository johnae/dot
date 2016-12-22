export ZSH=$HOME/.profile.d
export PROJECTS=~/Development

if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

typeset -U config_files
config_files=($ZSH/**/*.zsh)

# load paths
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but paths
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch banghist sharehistory hist_ignore_all_dups hist_ignore_space
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
fpath=(/usr/share/fzf $fpath)
zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"

alias vim=nvim
alias spotify="spotify --force-device-scale-factor=1.7"
PATH="$PATH:$HOME/Local/bin"

eval "$(direnv hook zsh)"

## Instead of something like:
## alias home="GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME git"
## let's just use git like normal but with proper env vars
## set if we're in $HOME - makes most integrations just work
## seamlessly (like airblade/gitgutter vim plugin for example)
function chpwd {
  if [ "$HOME" = "$(pwd)" ]; then
    export GIT_WORK_TREE=/home/john
    export GIT_DIR=/home/john/.cfg
  else
    unset GIT_WORK_TREE
    unset GIT_DIR
  fi
}

NDIRS=2
function gitpwd() {
  local -a segs splitprefix; local prefix gitbranch
  segs=("${(Oas:/:)${(D)PWD}}")
  color="green"
  branchcolor=$color

  if gitprefix=$(git rev-parse --show-prefix 2>/dev/null); then
    splitprefix=("${(s:/:)gitprefix}")
    branch=$(git name-rev --name-only HEAD 2>/dev/null)
    if ! $(git diff-index --quiet HEAD 2>/dev/null); then
      branchcolor="magenta"
    fi
    if (( $#splitprefix > NDIRS )); then
      print -n "%F{$color}${segs[$#splitprefix]}@%F{$branchcolor}$branch%f "
    else
      segs[$#splitprefix]+="@%F{$branchcolor}$branch"
    fi
  fi

  print "%F{$color}${(j:/:)${(@Oa)segs[1,NDIRS]}}%f "
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
chpwd
