#!/bin/zsh

sudoRequired() {
  if [[ $UID != 0 ]]; then
      echo "Please run this script with sudo:"
      echo "sudo $0 $*"
      exit 1
  fi
}

copyZshrc() {
  cp ../settings/.zshrc $HOME/
  cp ../settings/.zprofile $HOME/
  source $HOME/.zshrc
}

installBrew() {
  # 2021/03/25 fetched
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

installBrewPackage() {
  brew install gh
  brew install git
  brew install rbenv
  brew tap homebrew/cask-fonts
  brew install cask-fonts
  brew install font-hackgen-nerd
}

installBrewCasks() {
  brew install --cask google-chrome
  brew install --cask slack
  brew install --cask warp
  brew install --cask fork
  brew install --cask raycast
  brew install --cask visual-studio-code
  brew install --cask google-japanese-ime
  brew install --cask figma
  brew install --cask xcodes
  brew install --cask macs-fan-control
}

main() {
  echo "install started"
  sudoRequired
  echo "copy your zshrc"
  copyZshrc
  echo "install homebrew"
  installBrew
  echo "install brew packages"
  installBrewPackage
  echo "install brew casks"
  installBrewCasks
}

# --------------------------------------------------------------- #

main
