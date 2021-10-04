# WSL Install

* Install and Set Up WSL
* NVM and Node.js
* Pyenv and Python
* Rbenv and Ruby
* PostgreSQL
* VSCode
* Vim
* Neovim?
* GitHub CLI
* Set up SSH and GitHub on both WSL and Powershell

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
