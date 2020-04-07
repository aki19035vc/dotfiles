DOTROOT=$HOME/dotfiles

# homebrewのインストール
#./$DOTROOT/homebrew/install.sh

install_list=("zsh"
              "rbenv"
              "pyenv"
              "source-code-pro"
              "emacs"
              "hyper"
              "docker"
              "firefox"
              "slack"
              "hyperswitch"
              "karabiner-elements"
             )


for i in "${install_list[@]}"
do
    target=$DOTROOT/$i/install.sh
    chmod u+x $target
    ./$target
    #ls -l $DOTROOT/$i/install.sh
done
