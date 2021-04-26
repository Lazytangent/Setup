# Some setup/config for Mac

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

Skip to next subsection for minimal Vim config.

Install `Vim-Plug` for Vim:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install `Vim-Plug` for Neovim:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Clone the Neovim config files to `~/.config/nvim`:

```sh
git clone git@github.com:Lazytangent/nvim-conf.git ~/.config/nvim
nvim +PlugInstall
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
