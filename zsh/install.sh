export ZPLUG_HOME=$HOME/.zplug
mkdir $HOME/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME

ln -s ~/dotfiles/zsh/.zshenv $HOME
ln -s ~/dotfiles/zsh/.zshrc $HOME

mkdir -p $HOME/local/bin $HOME/local/lib

source .zshenv
source .zshrc
