#!/bin/bash

cd $(dirname $0)

ln -s .zshenv $HOME
ln -s .zshrc $HOME
git clone https://github.com/zplug/zplug $HOME/.zplug
