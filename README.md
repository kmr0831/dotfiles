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
終了したらbitwardenのログアウトを忘れずに
```
bw logout
```

`chezmoi -v apply`するとき必ずbitwardenのマスターパスワードを聞かれる
sessionを環境変数に入れると解消するかも
```
bw unlock
```
```
export BW_SESSION="unlockで取得したセッションキー"
```