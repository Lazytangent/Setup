#!/bin/bash

set -e

# Clone down Lazytangent/dotfiles if needed
cd ~
if [[ ! -d dotfiles ]]; then
  gh repo clone Lazytangent/dotfiles ~/dotfiles
fi

# Get system choice
echo "Systems are: m1, mbp16, mbp13, mbair, manjaro, ubuntu"
read -p "Enter system: " system

# Check for pre-existing zsh config files
if [[ -f ~/.zshrc ]]; then
  cp ~/.zshrc ~/.zshrc.bak
  rm ~/.zshrc
  rm ~/.zsh_aliases
  rm ~/.zsh_functions
fi

# Make symbolic links to zsh files
ln -s ~/dotfiles/universal/zshrc/$system/.zshrc ~/.zshrc
ln -s ~/dotfiles/universal/zshrc/$system/.zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/universal/zshrc/$system/.zsh_functions ~/.zsh_functions

# Check for antigen file
[[ -f ~/.antigenrc ]] && rm ~/.antigenrc

# Symbolic link for ~/.antigenrc file
if [[ $system == m1 ]]; then
  ln -s ~/dotfiles/universal/antigenrc/.m1.antigenrc ~/.antigenrc
else
  ln -s ~/dotfiles/universal/antigenrc/.antigenrc ~/.antigenrc
fi

# Grab antigen setup file if necessary
[[ ! -f ~/antigen.zsh ]] && curl -L git.io/antigen > ~/antigen.zsh
