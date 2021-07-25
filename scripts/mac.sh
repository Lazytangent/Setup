#!/bin/bash

# Set some reasonable defaults for Finder and Screenshots

set -e

cd ~
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location "/Users/$(whoami)/Screenshots"
killall SystemUIServer

defaults write com.apple.finder ShowPathbar -bool true
defaulst write com.apple.finder ShowStatusBar -bool true
