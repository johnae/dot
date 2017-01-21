# My Dotfiles

These are the dotfiles I use to customize Arch Linux (mostly). I used to use something called homeshick which linked files into my home but I've since opted to use an arguably simpler approach.

The ```.profile.d``` has been divided up into many files named by feature and contained within similarly named directory, eg:

```.profile.d/zsh``` contains the configuration directly related to zsh. In there there are several files named after what they configure,
eg ```path.zsh``` sets up the path. Those, by the way, always run first. ```aliases.zsh``` sets up some aliases. Should be pretty straightforward.

See ```.zshrc``` for the ordering and how it runs. There's also hostname based config files.


## Installation

```sh
$ git clone --bare https://github.com/johnae/dot.git ~/.cfg
$ cd ~
$ GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.cfg git checkout
$ GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.cfg git config --local status.showUntrackedFiles no
```

If there are any complaints like files already being there, this should help:

```sh
$ mkdir -p .cfg-backup && GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.cfg git checkout 2>&1 | egrep "\s+\." | awk '{print $1}' | xargs -I{} mv {} .cfg-backup/{}
```

Above backs up any preexisting files to .cfg-backup.

## Neovim bootstrap

I'm using dein, https://github.com/Shougo/dein.vim, to manage plugins. This needs to be somewhat manually installed first. Like this:

```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/dein-installer.sh
sh /tmp/dein-installer.sh 
```

One neovim caveat is currently that if neovim is opened when CWD=$HOME it won't be able to install plugins because GIT_DIR and GIT_WORK_TREE will be set
for home git repo (and will interfere with deins pulling of plugins). The reason it is this way (for now anyway) is that I enjoy git gutter in vim even
for the things I change in my dotfiles. Maybe there's a workaround I'll implement sometime.

## Local settings

The file ```~/.defaultrc``` is always loaded first, after that ```~/.localrc``` will be loaded if present. That may
override settings in .defaultrc. ~/.localrc is not checked in and shouldn't be.


## License

The code is available under the [MIT license](LICENSE).
