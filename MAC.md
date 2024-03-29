# Some setup/config for Mac

* [Change Some Defaults](#change-some-default-settings-on-macos)
* [Homebrew](#install-homebrew)
* [Alacritty](#setup-alacritty)
* [Antigen](#install-antigen)
* [Dot Files](#dot-files)
* [Python](#install-pyenv-and-pipenv)
* [Node.js](#install-nvm-and-nodejs)
* [Docker](#docker-and-docker-desktop)
* [Vim and Neovim](#vim-and-neovim-setup)
* [M1 Setup](#m1-mac-stuff)
* [Antigen](#antigen)
* [TMUX Plugins](#tmux-plugins)
* [Homebrew packages](#homebrew-packages)
* [Compaudit/Compinit](#fix-compauditcompinit)
* [Fonts](#fonts)
* [Antigen Error](#antigen-error)
* [Git](#git-config)
* [SSH](#setting-up-ssh)
* [Postgresql](#postgresql)

## Change some default settings on MacOS

```bash
# Set up a Screenshots folder
cd # Go home
mkdir Screenshots
defaults write com.apple.screencapture location /Users/<username>/Screenshots
killall SystemUIServer # Reset system settings to read new default
```

```bash
# Edit Finder to show more info
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
```

```bash
# Install xcode CLI tools
xcode-select --install # Will open a window for confirmation
```

```bash
# Set Git global config
git config --global user.email "<email>"
git config --global user.name "<username>"
git config --global core.editor "<editor>"
```

```bash
# Set vi bindings in MacOS
set -o vi
```

### GPG

[Set up GPG for Git signing](https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e)

## Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Brewfile with `brew bundle`

### Caffeination for long running installs

```bash
# Get the pid of a process
pgrep "<name>"

# Caffeinate while watching for that process
caffeinate -disu -w `pgrep "<name>"`
```

## Setup Alacritty

Install Alacritty as a Homebrew Cask or build from source

### Homebrew

Not recommended since some of my personal config depends on a more up-to-date
version

```sh
brew install --cask alacritty
```

See the [Alacritty setup file][alacritty.md] for how to build alacritty from source.

#### Note for ARM

Alacritty might start with the `x86` version of the shell, probably in `zsh`. On
an M1 Mac, ideally it would start in the `arm64` version of the shell. To check,
run

```sh
arch
```

If the output is `i386`, meaning it's running the `x86` version of the shell,
change it with the following command:

```sh
arch -x86_64 zsh
```

Check out `https://github.com/Lazytangent/.config` for the dot files from the
`~/.config` directory.

### Build from Source

Follow the instructions found in the
[Alacritty repo](https://github.com/alacritty/alacritty) which is normally in
the `INSTALL.md` file in the root of the repository.

#### Requirements
- Cargo
- Rust

## Dot Files

Clone the dot-files repository.

```bash
git clone git@github.com:Lazytangent/dotfiles.git
```

## Install Antigen

```bash
curl -L git.io/antigen > ~/antigen.zsh
```

## Install Pyenv and Pipenv

```bash
brew install pyenv
```

See their [README](https://github.com/pyenv/pyenv) for more information on
install.

```bash
pip install pipenv
```

## Install nvm and Node.js

See NVM's [page](https://github.com/nvm-sh/nvm) for install script (this changes from time to time).

## Docker and Docker Desktop

## Vim and Neovim Setup

### Neovim Lua config

Clone the repo

```bash
git clone git@github.com:Layztangent/nvim-conf.git ~/.config/nvim
```

Run Neovim to auto-install Packer.nvim

```bash
nvim
```

Run the compile command in Neovim

```viml
:PackerCompile
```

Run the Packer install command in Neovim

```viml
:PackerInstall
```

Update package list when necessary

```viml
:PackerSync
```

Skip to next subsection for minimal Vim config.

Deprecated:

> Install `Vim-Plug` for Vim:
>
> ```bash
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
> ```
>
> Install `Vim-Plug` for Neovim:
>
> ```bash
> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
>        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
> ```
>
> Clone the Neovim config files to `~/.config/nvim`:
>
> ```bash
> git clone git@github.com:Lazytangent/nvim-conf.git ~/.config/nvim
> nvim +PlugInstall
> ```

### Vim-ALE Setup

To make use of the ALE fixers, you'll need to install them on your machine.

```bash
pip install autopep8
```

### Minimal Vim config

```bash
git clone git@github.com:Lazytangent/vim-conf.git --branch minimal ~/.vim_conf
sh ~/.vim_conf/install.sh
```

## M1 Mac Stuff

### Homebrew Permissions

Occasionally, a homebrew install or upgrade will give this error:

```bash
Error: Permission denied @ apply2files - <directory_here>
```

To resolve this, do the following to give yourself the proper permissions on the
mentioned directory.

```bash
sudo chown -R $(whoami):staff /opt/homebrew/*
```

There's also another command if the first one alone doesn't work:

```bash
sudo chmod -R g+rwx /opt/homebrew/*
```

## Updating Pyenv's Python Version List

Run `cd $(pyenv root)` to go to the location where pyenv was cloned.

This will update the version list that you can see with `pyenv install --list`.

Once the local repo has been updated, you can `pyenv install` whichever version
you want.

## Antigen

```bash
cd
curl -L git.io/antigen > ~/antigen.zsh
```

## TMUX Plugins [Deprecated]

I've stopped using Tmux after switching to the Kitty terminal.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Be sure to grab the `.tmux.conf` from the dot-files repo.

Use `<C-A>I` to install plugins.

Use `<C-A>R` to reload config file.

### `tmuxp`

```bash
pip install tmuxp
```

## Homebrew packages

Other Homebrew packages to install are:

<!-- Keep this alphabetized -->
* `bat`
* `cmacrae/formulae/spacebar`
* `direnv`
* `docker`
* `exa`
* `fzf`
* `gh`
* `koekeishiya/formulae/skhd`
* `postgresql`
* `pyenv`
* `pyenv-virtualenv`
* `rbenv`
* `starship`
* `the_silver_searcher`
* `zoxide`

### Yabai

[Yabai Wiki]

[Yabai Wiki]: https://github.com/koekeishiya/yabai/wiki

Since there are extra steps to enable Yabai's scripting addition for full
functionality, follow their instructions to get set up.

If you don't want the following functionality, then you can just install and
start it without like any other `brew service`.

- `koekeishiya/formulae/yabai`

#### Features that require partially disabled SIP:

- focus/create/destroy space without animation
- move space (and its windows) left, right or to another display
- remove window shadows
- enable window transparency
- control window layers (make windows appear topmost)
- sticky windows (make windows appear on all spaces)
- move window by clicking anywhere in its frame
- toggle picture-in-picture for any given window

### Firefox Developer Edition

```bash
brew tap homebrew/cask-versions
```

```bash
brew install firefox-developer-edition
```

### Homebrew Casks

```bash
brew install --cask
```

* `postbird`
* `spotify`
* `zoom`
* `beekeeper-studio`
* `hammerspoon`
* `mactex`
* `kitty`
* `skim`

## `caffeinate`

Run long-running commands with prefixed with `caffeinate -di` to prevent the
screen from turning off during the install process.

## AutoRaise

Clone the repo.

```bash
git clone https://sbmpost/AutoRaise.git
```

```bash
cd AutoRaise
```

```bash
make clean && make
```

### Config Files

Config file is in the `.config` repository within the `AutoRaise/config` file.

## Fix Compaudit/Compinit

When getting "insecure directories messaged"

```bash
compaudit | xargs chmod g-w
```

## Fonts

```bash
brew tap homebrew/cask-fonts
```

```bash
brew install --cask <font-name>
```

* JetBrains Mono
* MesloLGS NF

## Antigen Error

Antigen: Another process is running.

```bash
antigen-reset
```

## Git Config

```bash
git config --list --show-origin
```

## Shortcuts

## Setting up SSH

To make SSH-ing into other computers easier, copy the public key from one of the
`.pub` files found in your `~/.ssh` directory on the computer you're SSH-ing
from and place it into the `~/.ssh/authorized_keys` file on the computer you're
SSH-in into.

## Xcode beta and two versions

Switch to the version of Xcode you want to use:
```bash
sudo xcode-select -switch ~/Applications/Xcode-beta.app/
```

You might have to sign the permissions:
```bash
sudo xcodebuild -license accept
```

## Postgresql

Using Homebrew to upgrade from one version of Postgresql to the next might cause
some issues if the data isn't compatible. You can run (or try running)

```bash
brew postgresql-database-upgrade
```

to make Homebrew try to upgrade your database for you so that it's compatible
with the updated version of Postgresql.

## Hammerspoon

See the [Hammerspoon setup instructions][hammerspoon.org] to set up Hammerspoon and HHTWM.

## Run Zsh config setup interactively

```bash
autoload -U zsh-newuser-install
zsh-newuser-install -f
```

[alacritty.md]: ./Alacritty.md
[hammerspoon.md]: ./hammerspoon.org
