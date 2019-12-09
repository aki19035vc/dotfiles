source $ZPLUG_HOME/init.zsh

zstyle ':completion:*:default' menu select=2

# Pure theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2


# GitHub Releases からインストールする
# また、コマンドは rename-to でリネームできる
zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"*darwin*amd64*"

# zplug "b4b4r07/enhancd", use:init.sh
# # zplug "mollifier/anyframe", at:4c23cb60


# zplug "junegunn/fzf-bin", \
#       from:gh-r, \
#       as:command, \
#       rename-to:fzf, \
#       on zplug "b4b4r07/enhancd", of:enhancd.sh

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
alias ll='ls -l'


# alias
alias ssh-kki='ssh t16cs048@kw02.kki.yamanashi.ac.jp'
alias ssh-kki-jupyter='ssh -L 8888:localhost:8888 t16cs048@kw02.kki.yamanashi.ac.jp -Y'
alias ssh-nabe='ssh fujisaki@ai.cs.yamanashi.ac.jp -p 40022'
