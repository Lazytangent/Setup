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
defaulst write com.apple.finder ShowStatusBar -bool true
