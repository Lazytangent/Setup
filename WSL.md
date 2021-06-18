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
