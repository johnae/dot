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

fzfcmd() {
  [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}

## works seamlessly with gitgutter if started from homedir
function nvim {
  if [ "$HOME" = "$(pwd)" ]; then
    GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.cfg $_NVIM $*
  else
    $_NVIM $*
  fi
}

