# Manjaro Setup

* [Basic Commands](#basic-commands)
* [GitHub](#github)
* [Starship.rs](#starshiprs)
* [Antigen Zsh](#antigen-zsh)
* [Set up for AUR packages](#set-up-for-aur-packages)
* [pyenv](#pyenv)
* [nvm](#nvm)
* [rbenv](#rbenv)
* [Neovim](#neovim)

## Basic Commands

Update package list and upgrade outdated packages

```sh
sudo pacman -Syu
```

Search for a `name` in the package manager

```sh
pacman -Ss <name>
```

Install a package by `name`

```sh
sudo pacman -S <name>
```

## GitHub

* [SSH](#ssh)
* [CLI](#cli)

### SSH

Generate a key

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Start ssh-agent in the background

```sh
eval "$(ssh-agent -s)"
```

Add SSH private key to ssh-agent

```sh
ssh-add ~/.ssh/id_ed25519
```

### CLI

Install via `pacman`

```sh
sudo pacman -S github-cli
```

## Starship.rs

Install/Update Starship with install script

```sh
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

## Antigen Zsh

Install Antigen from repository

```sh
curl -L git.io/antigen > ~/antigen.zsh
```

## Set up for AUR packages

Install prerequisites

```sh
sudo pacman -S base-devel
```

Acquire build files

```sh
git clone <their_url>
```

Build the package

```sh
cd <package_name>
```

Gathers dependencies, builds, installs, and cleans up

```sh
makepkg -sirc
```

## pyenv

Basic GitHub Checkout

```sh
git clone git@github.com:pyenv/pyenv.git ~/.pyenv
```

Or with GitHub's CLI

```sh
gh repo clone pyenv/pyenv ~/.pyenv
```

Place into `~/.zprofile` and `~/.profile`

```sh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

## rbenv

See [[Set up for AUR packages]] for initial setup

```sh
git clone https://aur.archlinux.org/rbenv.git
```

```sh
cd rbenv
```

```sh
makepkg -sirc
```

Follow instructions from next command to set up rbenv in your shell

```sh
rbenv init
```

Use the following command to run `rbenv-doctor` to make sure rbenv is set up
properly

```sh
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
```

## nvm

## Installing Neovim Nightly

First, install the prerequisites:

```sh
sudo pacman -S base-devel cmake unzip ninja tree-sitter
```

Clone, the repo somewhere

```sh
git clone git@github.com:neovim/neovim.git ~/Documents/Neovim/neovim
cd ~/Documents/Neovim/neovim
```

Run `make`

```sh
make CMAKE_BUILD_TYPE=Release
sudo make install
```

To rebuild

```sh
make distclean
```
