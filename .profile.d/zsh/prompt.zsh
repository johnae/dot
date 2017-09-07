## manage home
alias home="GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME git"

## wrap it up for easier use in prompt below
function _pgit {
  if [ "$HOME" = "$(pwd)" ]; then
    home $*
  else
    git $*
  fi
}

NDIRS=2
function _pgitpwd {
  local -a segs splitprefix; local prefix gitbranch
  segs=("${(Oas:/:)${(D)PWD}}")
  color="green"
  branchcolor=$color

  if gitprefix=$(_pgit rev-parse --show-prefix HEAD 2>/dev/null); then
    splitprefix=("${(s:/:)gitprefix}")
    ## gets around the issue of touching a file (eg. mod time)
    ## and git diff returning non-zero exit code. If one does a
    ## "git status" that doesn't happen after for some reason.
    ## Not entirely sure why.
    _pgit status 2>&1 > /dev/null
    branch=$(_pgit symbolic-ref HEAD 2>/dev/null | sed 's!refs\/heads\/!!')
    if ! $(_pgit diff-index --quiet HEAD 2>/dev/null); then
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

function _bgjobs {
  NUMJOBS=$(jobs | wc -l | tr -d ' ')
  if [ "$NUMJOBS" != "0" ]; then
    msg="($NUMJOBS jobs)"
    if [ "$NUMJOBS" = "1" ]; then
      msg="($NUMJOBS job)"
    fi
    print -n "%F{magenta}$msg%f"
  fi
}

function cnprompt6 {
  case "$TERM" in
    xterm*|rxvt*)
      precmd() {  print -Pn "\e]0;%m: %~\a" }
      preexec() { printf "\e]0;$HOST: %s\a" $1 };;
    esac
    setopt PROMPT_SUBST
    PS1='%B%m%(?.. %??)%(1j. %j&.)%b $(_pgitpwd)%B%(!.%F{red}.%F{yellow})$(_bgjobs)%-#${SSH_CLIENT:+%#} %b'
    RPROMPT=''
  }

  function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(cnprompt6) $EPS1"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

cnprompt6
