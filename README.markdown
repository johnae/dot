# My Dotfiles (and nix expressions)

These are the dotfiles I use to customize Arch Linux (mostly). I used to use something called homeshick which linked files into my home but I've since opted to use an arguably simpler approach.

The ```.profile.d``` has been divided up into many files named by feature and contained within similarly named directory, eg:

```.profile.d/zsh``` contains the configuration directly related to zsh. In there there are several files named after what they configure,
eg ```path.zsh``` sets up the path. Those, by the way, always run first. ```aliases.zsh``` sets up some aliases. Should be pretty straightforward.

See ```.zshrc``` for the ordering and how it runs. There's also hostname based config files.

## Emacs

See [README.org](.config/nixpkgs/packages/my-emacs/README.org) for emacs configuration - handled through the [nix package manager](https:nixos.org). Emacs configuration is untangled from that org file. Install it like this:

`nix-env -iA nixos.my-emacs`

or if not on NixOS:

`nix-env -iA nixpkgs.my-emacs`


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


## Local settings

The file ```~/.defaultrc``` is always loaded first, after that ```~/.localrc``` will be loaded if present. That may
override settings in .defaultrc. ~/.localrc is not checked in and shouldn't be.


## License

This code is released under the [MIT License](http://opensource.org/licenses/MIT)
