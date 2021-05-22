# Some setup/config for Mac

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

### Installing the nightly version of Neovim

On Mac, install luajit and luarocks first:

```sh
brew install --HEAD luajit luarocks
```

If it gives you an error about them being already installed, run

```sh
brew unlink <package_name>
```

Then, run the install command again. You might have to do that for Neovim as
well.

```sh
brew install --HEAD neovim
```

### Installing Language Servers for Nvim-LspConfig

#### clangd

```sh
brew install llvm
```

Then, in your `.zshrc`, add a line to add the location of `llvm/bin` to the
path.

On Intel Macs:

```sh
export PATH="/usr/local/opt/llvm/bin:$PATH"
```

On Apple Silicon Macs:

```sh
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
```

#### html

```sh
npm install -g vscode-html-languageserver-bin
```

#### jedi language server

```sh
pip install -U jedi-language-server
```

#### JSON

```sh
npm install -g vscode-json-languageserver
```

#### pyright

```sh
npm install -g pyright
```

#### TSServer

```sh
npm install -g typescript typescript-language-server
```

#### Vim

```sh
npm install -g vim-language-server
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

## Updating Pyenv

Run `cd $(pyenv root)` to go to the location where pyenv was cloned.

This will update the version list that you can see with `pyenv install --list`.

Once the local repo has been updated, you can `pyenv install` whichever version
you want.

## Homebrew packages

Other Homebrew packages to install are:

* `exa`
* `bat`
* `the_silver_searcher`
