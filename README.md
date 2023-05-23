# 移行前
Brewfileを最新にする
# 以降後
1. Xcodeをインストール
```
xcode-select --install
```
2. homebrewをインストール
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
3. chezmoiとbitwarden-cliインストール
```
brew install chezmoi bitwarden-cli
```
4. bitwardenにログイン
[API key](https://bitwarden.com/ja-JP/help/personal-api-key/)
```
bw login --apikey
```
```
bw unlock
```
```
bw sync
```
5. chezmoiを実行
```
chezmoi init --apply https://github.com/kmr0831/dotfiles.git
```
6. Brewfileからソフトをインストール
```
brew bundle --file '~/Brewfile'
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

httpsでgithubにpushしようとするときはアクセストークンが必要。今のところclassicトークンでよし。[Access Token](https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#personal-access-token-classic-の作成)
```
git push -u origin main
```
Username: kmr0831
Password: アクセストークン(biwtardenのgithubのノートにアクセストークンをメモしてある)

6. その他
google-japanese-imeの設定