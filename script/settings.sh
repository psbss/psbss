#!/bin/sh

setupGitUser() {
  printf "Set your Name: "
  read NAME
  git config --global user.name "$NAME"
  printf "Set your Email: "
  read EMAIL
  git config --global user.email "$EMAIL"
  echo "Setupped your git config"
}

main() {
  echo "Set git settings"
  setupGitUser
}

main