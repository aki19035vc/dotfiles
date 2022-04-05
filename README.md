# dotfiles

## dotifileの配置方法

```
deploy.sh
```

※ Brewfileも配置されます

## homebrewのインストール

※ dotfilesを配置後の方が作業が楽です

1. xcodeをインストール

2. homebrewをインストール
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

3. Brewfileからアプリをインストール
```
brew bundle
```

## iterm2のプロファイル設定方法

1. `Preferences > Profiles > Other Actions > Import JSON Profiles...`へアクセスし、`iterm2/profile_base_snazzy.json`をインポートする
1. 追加された`profile_base_snazzy`を選択し、`Other Actions > Set as Default`でデフォルトに設定する

## dockerコンテナ上でC-pを有効にする方法
`~/.docker/config.json`に書きを追加する
```
{
  "detachKeys": "ctrl-w,q"
}
```
