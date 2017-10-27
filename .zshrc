export ZSH=$HOME/.profile.d
export TERM="xterm-256color"

setopt promptsubst

## set up environment defaults
if [[ -a ~/.defaultrc ]]
then
  source ~/.defaultrc
fi

## allow environment overrides (don't check in this file)
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

typeset -U config_files
config_files=($ZSH/**/*.zsh(N))

hn=$(hostname)
typeset -U host_config_files
host_config_files=($ZSH/**/*.zsh.$hn(N))

# load paths
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load functions
for file in ${(M)config_files:#*/functions.zsh}
do
  source $file
done

# load host specific paths
for file in ${(M)host_config_files:#*/path.zsh.$hn}
do
  source $file
done

# load host specific functions
for file in ${(M)host_config_files:#*/functions.zsh.$hn}
do
  source $file
done

# load everything but paths and functions
for file in ${${config_files:#*/path.zsh}:#*/functions.zsh}
do
  source $file
done

# load everything host specific but paths and functions
for file in ${${host_config_files:#*/path.zsh.$hn}:#*/functions.zsh.$hn}
do
  source $file
done

## allow local additional paths (don't check in this file)
if [[ -a ~/.localpaths ]]
then
  source ~/.localpaths
fi

export PATH