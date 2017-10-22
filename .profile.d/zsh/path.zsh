function _add_path() {
    [[ ":$PATH:" != *":${1}:"* ]] && PATH="${1}:${PATH}"
}

_add_path $HOME/.gem/ruby/2.4.0/bin
_add_path $HOME/Local/node_modules/.bin
_add_path $HOME/.luarocks/bin
_add_path $HOME/.cargo/bin
_add_path $HOME/.local/bin
_add_path $HOME/Local/bin

export PATH
