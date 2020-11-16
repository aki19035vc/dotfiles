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
              "virtualbox"
              "vagrant"
              "mutagen"
              "sequel-pro"
              "source-highlight"
              "circleci"
             )

# circleci-token: 84886554c82f231da25fd57b454e6099d150cbb6

for i in "${install_list[@]}"
do
  target=$DOTROOT/$i/install.sh
  chmod u+x $target
  $target
done
