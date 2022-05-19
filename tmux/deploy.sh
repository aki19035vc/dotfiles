#!/bin/bash

cd $(dirname $0)

ln -s "$(pwd)/.tmux.conf" $HOME
