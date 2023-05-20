# 移行前
Brewfileを最新にする
# 以降後
Xcodeをインストール
```
xcode-select --install
```
homebrewをインストール
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
bitwardenにログイン
[API key](https://bitwarden.com/ja-JP/help/personal-api-key/)
```
bw login --apikey
```
chezmoiを実行
```
chezmoi init --apply https://github.com/kmr0831/dotfiles.git
```