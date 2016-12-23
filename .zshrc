export ZSH=$HOME/.profile.d
export PROJECTS=~/Development
export TERM="xterm-256color"

setopt promptsubst

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
