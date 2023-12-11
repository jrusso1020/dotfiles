#!/usr/bin/env bash

#
# Install homebrew and essential packages

if ! type brew > /dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

echo "Installing packages from Brewfile..."

/opt/homebrew/bin/brew bundle install --file=macos/Brewfile

echo "All packages installed."