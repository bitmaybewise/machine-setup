#!/bin/bash

if command -v brew >/dev/null; then
    echo "Brew already installed..."
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

function brew_install() {
    if command -v $1 >/dev/null; then
        echo "$1 is already installed"
    else
        echo "installing $1"
        brew install $1
    fi
}
export -f brew_install

function brew_install_cask() {
    if command -v $1 >/dev/null; then
        echo "cask $1 is already installed"
    else
        echo "installing cask $1"
        brew install --cask $1
    fi
}
export -f brew_install_cask

echo "Installing packages..."
comm -23 brewlist.txt <(brew list --installed-on-request) | xargs -I {} bash -c 'brew_install {}'
comm -23 brewcasks.txt <(brew list --casks -1) | xargs -I {} bash -c 'brew_install_cask {}'
echo "Done!"