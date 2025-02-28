export ZPLUG_HOME=$HOME/.zplug

source $ZPLUG_HOME/init.zsh

zstyle ':completion:*:default' menu select=2

# Pure theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "junegunn/fzf"

export FZF_DEFAULT_OPTS="--height 55% --reverse --border"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

# ディレクトリ名だけで移動
setopt auto_cd

# 改行をCtrl-jで行う
bindkey '^J' self-insert

# ls関連
case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls="ls -aG"
        ;;
    linux*)
        alias ls="ls -a --color"
        ;;
esac

chpwd() {ls}

# 関数
em() { emacs $1 & }

# fzf: ヒストリーのインクリメンタル検索
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N select-history
bindkey '^r' select-history

# fzf: cdでの移動をインクリメンタルに選択
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fzf: ブランチをインクリメンタルにチェックアウト
br() {
  git branch | fzf | xargs git checkout
}

# fzf: git log で表示した各コミットをshow
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF"
}

fdocker_exec_bash() {
  docker_id=$(docker ps | fzf | awk '{print $1}')
  docker exec -it $docker_id bash
}

# alias
alias ll='ls -l'
alias grep='grep --color'
alias be='bundle exec'
alias dcs='docker-compose -f docker-compose.yml -f docker-compose-dev.yml'
alias abrew="/opt/homebrew/bin/brew"

# homebrew
export PATH="/opt/homebrew/bin:$PATH"

# tmux
export TERM=xterm-256color

# rbenv
# M1: arch -arm64 rbenv install x.x.x
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# less (-LオプションでLESSOPENの指定を無視できる)
export LESS="-R"
