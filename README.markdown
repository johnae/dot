# My Dotfiles

These are the dotfiles I use to customize Arch Linux (mostly). I used to use something called homeshick which linked files into my home but I've since opted to use an arguably simpler approach.

The ```.profile.d``` has been divided up into many files named by feature and contained within similarly named directory, eg:

```.profile.d/zsh``` contains the configuration directly related to zsh. In there there are several files named after what they configure,
eg ```path.zsh``` sets up the path. Those, by the way, always run first. ```aliases.zsh``` sets up some aliases. Should be pretty straightforward.

See ```.zshrc``` for the ordering and how it runs. There's also hostname based config files.


## Installation

First off, this is only for zsh since that's the shell I use. So it wont' work with anything else. In addition, off the top of my head, these tools are required for it to work reasonanly well:

- fzf - the fuzzy finder, https://github.com/junegunn/fzf (usually installable through package manager)
- direnv - unclutter your .profile, https://github.com/direnv/direnv (on arch can be installed through yaourt for example)

Then git clone something like this:

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

Above backs up any preexisting files to .cfg-backup. After all this, your home can be managed using:

```sh
home add
home pull
home push
```

Etc. It's just git with some special env vars for management. It's all in the repo files.

## Neovim bootstrap

I'm using dein, https://github.com/Shougo/dein.vim, to manage plugins. This needs to be somewhat manually installed first. Like this (when in home dir):

```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/dein-installer.sh
sh /tmp/dein-installer.sh .cache/dein
```

You will also want to install python2 and python3 + pip (for https://github.com/Shougo/deoplete.nvim). Then for both 2 and 3 install neovim. Probably a user install, like this:

```sh
pip install --user neovim ## for python2.x
pip3 install --user neovim ## for python3.x
```

The golang completion uses gocode (see https://github.com/zchee/deoplete-go). That can be installed like this:

```sh
go get -u github.com/nsf/gocode
```

One neovim caveat is currently that if neovim is opened when CWD=$HOME it won't be able to install plugins because GIT_DIR and GIT_WORK_TREE will be set
for home git repo (and will interfere with deins pulling of plugins). The reason it is this way (for now anyway) is that I enjoy git gutter in vim even
for the things I change in my dotfiles. Maybe there's a workaround I'll implement sometime.

## Local settings

The file ```~/.defaultrc``` is always loaded first, after that ```~/.localrc``` will be loaded if present. That may
override settings in .defaultrc. ~/.localrc is not checked in and shouldn't be.


## License

The code is available under the [MIT license](LICENSE).
