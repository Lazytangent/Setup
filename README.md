# Some setup/config for Mac

```bash
# Set up a Screenshots folder
cd # Go home
mkdir Screenshots
defaults write com.apple.screencapture location /Users/<username>/Screenshots
killall SystemUIServer # Reset system settings to read new default
```

```bash
# Edit Finder to show more info
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
```

```bash
# Install xcode CLI tools
xcode-select --install # Will open a window for confirmation
```

```bash
# Set Git global config
git config --global user.email "<email>"
git config --global user.name "<username>"
git config --global core.editor "<editor>"
```
