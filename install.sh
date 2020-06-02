DOTROOT=$HOME/dotfiles

install_list=("homebrew"
              "zsh"
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
              "tree"
              "git"
              "vagrant"
              "virtualbox"
             )

for i in "${install_list[@]}"
do
  target=$DOTROOT/$i/install.sh
  chmod u+x $target
  ./$target
  #ls -l $DOTROOT/$i/install.sh
done
