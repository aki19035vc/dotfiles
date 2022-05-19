#!/bin/bash

cd $(dirname $0)

ln -s "$(pwd)/.zshrc" $HOME
git clone https://github.com/zplug/zplug $HOME/.zplug
