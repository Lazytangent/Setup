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
