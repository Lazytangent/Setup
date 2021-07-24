# Manjaro Setup

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
