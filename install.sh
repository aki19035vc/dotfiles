DOTROOT=$HOME/dotfiles

brew bundle --global

install_list=(
    "zsh"
    "tmux"
    "emacs"
)

for i in "${install_list[@]}"
do
    target=$DOTROOT/$i/install.sh
    chmod u+x $target
    $target
done
