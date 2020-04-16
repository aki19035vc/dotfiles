#!/bin/bash

psg () {
  if [ -n "$1" ]; then
    ps aux | grep -E "PID|$1" | grep -v grep
  else
    echo "Usage"
    echo "第1引数: 検索したいプロセス名"
  fi
}

psg $1
