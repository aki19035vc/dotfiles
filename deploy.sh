#!/bin/bash

set -eu

cd $(dirname $0)

./homebrew/deploy.sh
./emacs/deploy.sh
./git/deploy.sh
./tmux/deploy.sh
./zsh/deploy.sh
