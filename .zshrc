export ZSH=$HOME/.profile.d
export PROJECTS=~/Development
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

# load host specific paths
for file in ${(M)config_files:#*/path.zsh.$hn}
do
  source $file
done

# load everything but paths
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# load everything host specific but paths
for file in ${${host_config_files:#*/path.zsh.$hn}:#*/completion.zsh.$hn}
do
  source $file
done
