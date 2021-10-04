# WSL Install

* Install and Set Up WSL
* Git
* NVM and Node.js
* Pyenv and Python
* Rbenv and Ruby
* PostgreSQL
* VSCode
* Vim
    * Universal-Ctags for Gutentags
    * FZF
* Neovim?
* GitHub CLI
* Set up SSH and GitHub on both WSL and Powershell
* Starship.rs
* Troubleshooting
    * Clock Drift

## Install and Set Up WSL

If Windows is up-to-date, then running `wsl --install` from an elevated
PowerShell instance should do the trick.

If not, then follow Microsoft's old instructions for installing WSL. Make sure
to install WSL2 instead of WSL1, as there are some features made available by
the upgrade.

## Git

The WSL version of Ubuntu doesn't bundle the latest version of Git.
So you have to add the git-core repository yourself.

```sh
sudo add-apt-repository ppa:git-core/ppa
```

Then, update the packaegs list and install git.

```sh
sudo apt update
```

```sh
sudo apt upgrade
```

Instructions can be found at [Git's documentation site][git-docs].

[git-docs]: https://git-scm.com/download/linux

## NVM and Node.js

Install the Node Version Manager with their curl script on their [GitHub
repository's README][nvm-sh].

[nvm-sh]: https://github.com/nvm-sh/nvm

## Pyenv and Python

### Prerequisites

In order to make use of `pyenv` you'll need to install Python build
dependencies.

```sh
sudo apt update
```

```sh
sudo apt install make build-essential libssl-dev zlib-dev \
    libbz2-dev libreadling-dev libsqlite2-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
    libffi-dev liblzma-dev
```

### Basic GitHub Checkout

Follow the instructions under [`Basic GitHub Checkout`][basic-github-checkout] to install `pyenv`
locally.

[basic-github-checkout]: https://github.com/pyenv/pyenv#basic-github-checkout

## Rbenv and Ruby

### Basic GitHub Checkout

Follow the instructions under [`Basic GitHub Checkout`][rbenv-github-checkout]
to install `rbenv` locally.

[rbenv-github-checkout]: https://github.com/rbenv/rbenv#basic-github-checkout

### Ruby-build

To install Ruby through `rbenv`, you'll also need to install the `ruby-build`
plugin for `rbenv`. Follow the instructions under [`Installation`][ruby-build].

```sh
mkdir -p "$(rbenv root)"/plugins
```

```sh
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root"/plugins/ruby-build
```

[ruby-build]: https://github.com/rbenv/ruby-build#installation

## PostgreSQL

Follow [Microsoft's instructions on setting up a database in
WSL][wsl-databases].

[wsl-databases]: https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-database#install-postgresql

## Vim

### Universal-Ctags for Gutentags

#### Dependencies

```sh
sudo apt install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev
```

#### GitHub Checkout and Build

```sh
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install # need sudo privileges to install in /usr/local/bin
```

### FZF

```sh
sudo apt install fzf
```

## Exa

### Rust

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Installing `exa`

```sh
cargo install exa
```

## Starship.rs

```sh
sh -c "$(curl -fsSL https://starship.rx/install.sh)"
```

## Clock Drift

Occasionally, the internal clock for WSL drifts away from the clock in Windows.
This usually causes some issues when using `apt` to update the package lists.

A quick fix is to use `hwclock`:

```sh
sudo hwclock -s
```

Another fix is to use the `ntpdate` package available in `apt`:

```sh
sudo ntpdate time time.windows.com
```
