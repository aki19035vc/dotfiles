brew install rbenv

source $HOME/.zshrc

INSTALL_VERSION=2.7.1
rbenv install $INSTALL_VERSION
rbenv global $INSTALL_VERSION

# brew install rbenv-communal-gems

# emacs: SQLレイヤー用
gem install sqlint
