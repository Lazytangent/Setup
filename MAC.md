# Some setup/config for Mac

* [Change Some Defaults](#change-some-default-settings-on-macos)
* [Homebrew](#install-homebrew)
* [Dot Files](#dot-files)
* [Python](#install-pyenv-and-pipenv)
* [Node.js](#install-nvm-and-nodejs)
* [Docker](#docker-and-docker-desktop)
* [Vim and Neovim](#vim-and-neovim-setup)
* [M1 Setup](#m1-mac-stuff)
* [Antigen](#antigen)

## Change some default settings on MacOS

```sh
# Set up a Screenshots folder
cd # Go home
mkdir Screenshots
defaults write com.apple.screencapture location /Users/<username>/Screenshots
killall SystemUIServer # Reset system settings to read new default
```

```sh
# Edit Finder to show more info
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
```

```sh
# Install xcode CLI tools
xcode-select --install # Will open a window for confirmation
```

```sh
# Set Git global config
git config --global user.email "<email>"
git config --global user.name "<username>"
git config --global core.editor "<editor>"
```

## Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Dot Files

Clone the dot-files repository.

```sh
git clone git@github.com:Lazytangent/dot-files.git
```

## Install Pyenv and Pipenv

```sh
brew install pyenv
```

See their [README](https://github.com/pyenv/pyenv) for more information on
install.

```sh
pip install pipenv
```

## Install nvm and Node.js

See NVM's [page](https://github.com/nvm-sh/nvm) for install script (this changes from time to time).

## Docker and Docker Desktop

## Vim and Neovim Setup

### Neovim Lua config

Clone the repo

```sh
git clone git@github.com:Layztangent/nvim-conf.git ~/.config/nvim
```

Run Neovim to auto-install Packer.nvim

```sh
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
> ```sh
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
> ```
>
> Install `Vim-Plug` for Neovim:
>
> ```sh
> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
>        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
> ```
>
> Clone the Neovim config files to `~/.config/nvim`:
>
> ```sh
> git clone git@github.com:Lazytangent/nvim-conf.git ~/.config/nvim
> nvim +PlugInstall
> ```

### Vim-ALE Setup

To make use of the ALE fixers, you'll need to install them on your machine.

```sh
pip install autopep8
```

### Minimal Vim config

```sh
git clone git@github.com:Lazytangent/vim-conf.git --branch minimal ~/.vim_conf
sh ~/.vim_conf/install.sh
```

## M1 Mac Stuff

### Homebrew Permissions

Occasionally, a homebrew install or upgrade will give this error:

```sh
Error: Permission denied @ apply2files - <directory_here>
```

To resolve this, do the following to give yourself the proper permissions on the
mentioned directory.

```sh
sudo chown -R $(whoami):staff /opt/homebrew/*
```

There's also another command if the first one alone doesn't work:

```sh
sudo chmod -R g+rwx /opt/homebrew/*
```

## Updating Pyenv's Python Version List

Run `cd $(pyenv root)` to go to the location where pyenv was cloned.

This will update the version list that you can see with `pyenv install --list`.

Once the local repo has been updated, you can `pyenv install` whichever version
you want.

## Antigen

```sh
cd
curl -L git.io/antigen > antigen.zsh
```

## TMUX Plugins

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Be sure to grab the `.tmux.conf` from the dot-files repo.

Use `<C-A>I` to install plugins.

Use `<C-A>R` to reload config file.

## Homebrew packages

Other Homebrew packages to install are:

* `exa`
* `bat`
* `the_silver_searcher`
* `starship`
* `postgresql`
* `tmux`
* `zoxide`
* `rbenv`
* `fzf`

### Universal Ctags

```sh
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

### Homebrew Casks

```sh
brew install --cask
```

* `rectangle`
* `postbird`
* `iterm2`

## Fix Compaudit/Compinit

When getting "insecure directories messaged"

```sh
compaudit | xargs chmod g-w
```

## Fonts

* JetBrains Mono
* MesloLGS NF

## Antigen Error

Antigen: Another process is running.

```sh
antigen-reset
```

## Git Config

```sh
git config --list --show-origin
```