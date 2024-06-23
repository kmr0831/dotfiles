# 移行前
Brewfileを最新にする
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
6. Brewfile からソフトをインストール
```
brew bundle --file '~/Brewfile'
```

終了したら bitwarden のログアウトを忘れずに
```
bw logout
```

httpsでgithubにpushしようとするときはアクセストークンが必要。今のところclassicトークンでよし。[Access Token](https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#personal-access-token-classic-の作成)
```
git push -u origin main
```
Username: kmr0831
Password: アクセストークン(biwtardenのgithubのノートにアクセストークンをメモしてある)

6. その他
google-japanese-imeの設定