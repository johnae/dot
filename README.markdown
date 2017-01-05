# John's Dotfiles

These are the dotfiles I use to customize Arch Linux (mostly). I used to use something called homeshick which linked files into my home but I've since opted to use an arguably simpler approach.

The .profile.d has been divided up into many files named by feature and contained within similarly named directory, eg:

```.profile.d/zsh```

Above directory contains the configuration directly related to zsh. In there there are several files named after what they configure:

```path.zsh```

Sets up the path. This (and any other files named path.zsh) runs before the rest of the files.

```aliases.zsh```

Some aliases.

Should be pretty straightforward I think. See ```.zshrc``` for how it all runs. There's more like hostname based files that only run on a certain host.

## Installation

```sh
$ git clone --bare https://github.com/johnae/dot.git ~/.cfg
$ cd ~
$ GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.cfg git checkout
$ GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.cfg git --local status.showUntrackedFiles no
```

If there are any complaints like files already being there, this should help:

```sh
$ mkdir -p .cfg-backup && GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.cfg git checko 2>&1 | egrep "\s+\." | awk '{print $1}' | xargs -I{} mv {} .cfg-backup/{}
```

Above backs up any preexisting files to .cfg-backup.


## Local settings

The file ```~/.localrc``` is always loaded first if present.


## License

The code is available under the [MIT license](LICENSE).
