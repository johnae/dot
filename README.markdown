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


## Local settings

The file ```~/.localrc``` is always loaded first if present.


## License

The code is available under the [MIT license](LICENSE).
