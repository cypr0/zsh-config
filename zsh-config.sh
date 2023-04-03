#!/bin/bash

# Checking for zsh
if ! ps -p $$ | grep -si zsh; then
  echo "Sorry, this script requires zsh."
  exit 1
fi

# Checking for bash as required by brew
if ! which bash | grep -si bash; then
  echo "Sorry, this script requires bash."
  exit 1
fi

# Checking for xcode-select as requirement for brew
if ! which xcode-select | grep -si xcode-select; then
  echo "xcode-select is not installed. We have to change that."
  xcode-select --install
fi

# Checking for brew
if ! which brew | grep -si brew; then
  echo "Brew is not installed. We have to change that."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Checking for Oh-my-posh
if ! brew ls --versions oh-my-posh | grep -si oh-my-posh; then
  echo "Oh-my-posh is not installed. We have to change that."
  brew update && brew install jandedobbeleer/oh-my-posh/oh-my-posh
fi

# Looking for existing .zshrc
if test -f "$HOME/.zshrc"; then
  echo ".zshrc already exists. Backing up."
  mv $HOME/.zshrc $HOME/.zshrc.bak
fi

cp .zshrc $HOME/.zshrc