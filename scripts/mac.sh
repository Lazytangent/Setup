#!/bin/bash

# Set some reasonable defaults for Finder and Screenshots

set -e

# Set ~/Screenshots to be default folder to store screenshots
cd ~
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location "/Users/$(whoami)/Screenshots"
killall SystemUIServer

# Change some of Finder's defaults
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Install Antigen
curl -L git.io/antigen > ~/antigen.zsh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages
brew update
brew install \
  bat \
  cmacrae/formulae/spacebar \
  direnv \
  docker \
  exa \
  fzf \
  gh \
  go \
  koekeishiya/formulae/skhd \
  postgresql \
  pyenv \
  pyenv-virtualenv \
  rbenv \
  starship \
  terraform \
  the_silver_searcher \
  tree \
  zoxide

brew tap homebrew/cask-versions
brew install firefox-developer-edition

brew install --cask \
  beekeeper-studio \
  mactex \
  postbird \
  spotify \
  zoom

# Configure GitHub CLI
# This will prompt you to set up GitHub. I prefer SSH over HTTPS, but you do you.
gh auth login --web

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# You'll need to clean up your rc file for your shell later if you already have
# lines configuring NVM

# Re-source shell rc file
source "$HOME"/.zshrc

# Install Node v14 (nvm will also set the first version of Node installed as
# default)
nvm install 14

# Install Python and set the default version
pyenv install 3.9.10
pyenv global 3.9.10

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Prompt to install lang servers
if read -q "choice?Install language servers for nvim?"; then
  npm i -g \
    @angular/language-server \
    bash-language-server \
    dockerfile-language-server-nodejs \
    pyright \
    typescript \
    graphql-language-service-cli \
    vscode-langservers-extracted \
    typescript-language-server \
    vim-language-server \
    sql-language-server \
    yaml-language-server \
    @prisma/language-server \
    stylelint-lsp \
    @tailwindcss/language-server \
    vls

  pip install -U \
    jedi-language-server \
    python-lsp-server \
    'python-lsp-server[all]' \
    black

  cargo install stylua

  brew install \
    efm-langserver \
    rust-analyzer \
    shellcheck \
    terraform-ls \
    terraform-lsp
else
  echo "Not installing language servers for nvim"
fi
