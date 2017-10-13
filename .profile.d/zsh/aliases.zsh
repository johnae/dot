# Color aliases

if [ "$(uname)" = "Linux" ]; then
  if command -V dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    # Only alias ls colors if dircolors is installed
    alias ls="ls -F --color=auto --group-directories-first"
  fi
fi

alias l="ls -lh"
alias ll="ls -lah"
if [ "$(uname)" = "Linux" ]; then
  alias grep="grep --color=auto"
  alias fgrep="fgrep --color=auto"
  alias egrep="egrep --color=auto"
  # make less accept color codes and re-output them
  alias less="less -R"
else
  CLICOLOR="YES"
  export CLICOLOR
  LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
  export LSCOLORS
fi

alias vim=edit
alias spotify="spotify --force-device-scale-factor=1.7"
alias xc="xclip -selection clipboard"

## httpie aliases
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="http $method"
done
