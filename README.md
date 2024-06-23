# 移行前
1. Brewfileを最新にする
```
// brew でインストールしたものを確認
brew bundle list
```
```
// 新しく追加したものがあれば Brewfile を更新
chezmoi edit Brewfile
```
# 以降後
1. Xcode をインストール
```
xcode-select --install
```
2. homebrew をインストール
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
3. chezmoi と bitwarden-cli インストール
```
brew install chezmoi bitwarden-cli
```
4. bitwarden にログイン
[API key](https://bitwarden.com/ja-jp/help/personal-api-key/)
```
bw login --apikey
```
```
bw unlock
```
```
// bw unlock すると `BW_SESSION` が発行されターミナルに表示されるので環境変数に入れる
export BW_SESSION="xxxxx"
```
```
bw sync
```
5. chezmoi を実行
```
chezmoi init --apply https://github.com/kmr0831/dotfiles.git
```
```
// chezmoi init で https 接続になっているので ssh 接続に変更する
git remote -v
git remote set-url origin git@github.com:kmr0831/dotfiles.git
ssh -T git@github.com
git remote -v
```
6. Brewfile からソフトをインストール
```
brew bundle --file '~/Brewfile'
```

終了したら bitwarden のログアウトを忘れずに
```
bw logout
```
6. その他
google-japanese-imeの設定