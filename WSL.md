# WSL Install

* Install and Set Up WSL
* NVM and Node.js
* Python
* Ruby
* PostgreSQL
* VSCode
* Vim
* Neovim?
* Set up SSH and GitHub on both WSL and Powershell

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
