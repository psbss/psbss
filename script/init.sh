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

nodebrewSetup() {
  nodebrew -v
  nodebrew install-binary stable
  nodebrew use stable
  node -v
  npm -v
}

installBrewPackage() {
  brew install gh
  brew install mas
  brew install cask-fonts
  brew install font-hackgen-nerd
  brew install nodebrew
  nodebrewSetup
}

installBrewCasks() {
  brew install --cask google-chrome
  brew install --cask visual-studio-code
  brew install --cask bitwarden
  brew install --cask karabiner-elements
  brew install --cask google-japanese-ime
  brew install --cask iterm2
  brew install --cask obs
  brew install --cask figma
}

installAppStoreApp() {
  mas install 539883307 # LINE
  mas install 497799835 # Xcode
  mas install 441258766 # Magnet
  mas install 490461369 # Bandwidth+
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
  echo "install AppStore Application"
  installAppStoreApp
}

# --------------------------------------------------------------- #

main
