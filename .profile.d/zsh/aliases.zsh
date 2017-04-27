# Color aliases
if command -V dircolors >/dev/null 2>&1; then
	eval "$(dircolors -b)"
	# Only alias ls colors if dircolors is installed
	alias ls="ls -F --color=auto --group-directories-first"
fi

alias l="ls -lh"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
# make less accept color codes and re-output them
alias less="less -R"

alias vim=nvim
alias spotify="spotify --force-device-scale-factor=1.7"
alias xc="xclip -selection clipboard"

npm_local() {
  pushd ~/Local/
  npm install $@
  popd
}

gpgsignoff() {
  echo "gpgsign = false"
  sed -i 's|gpgsign = true|gpgsign = false|g' ~/.gitconfig
}

gpgsignon() {
  echo "gpgsign = true"
  sed -i 's|gpgsign = false|gpgsign = true|g' ~/.gitconfig
}

nogpgsign() {
  gpgsignoff
  $@
  gpgsignon
}
