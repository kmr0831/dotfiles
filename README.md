# 移行前
### 1. Brewfile 等を最新にする

<details>

<summary>chezmoi のコマンド例</summary>

```diff
~  % chezmoi cd
~/.local/share/chezmoi (main) % code .

***VS Code でファイルを直接編集する & commit***

// diff が確認できる
~/.local/share/chezmoi (main) % chezmoi diff
? Master password: [hidden]
diff --git a/Brewfile b/Brewfile
index 35cad64a7b8de69a95dffe4c66ac53e85a51217c..2488f4f4632585f05963c14cbf4a7136ddfccc30 100644
--- a/Brewfile
+++ b/Brewfile
@@ -5,6 +5,8 @@ brew "bitwarden-cli"
 brew "chezmoi"
 brew "git"
 brew "colima"
+brew "docker"
+brew "docker-compose"
 brew "jq"
 brew "yq"
 brew "ghq"

// local にも反映する
~/.local/share/chezmoi +(main) % chezmoi apply

~/.local/share/chezmoi (main) % git push
```

```
// brew でインストールしたものを確認
brew bundle list
```

</details>

# 以降後
### 1. Xcode をインストール
```
xcode-select --install
```
### 2. homebrew をインストール
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### 3. chezmoi と bitwarden-cli インストール
```
brew install chezmoi bitwarden-cli
```
### 4. bitwarden にログイン
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
### 5. chezmoi を実行
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
### 6. Brewfile からソフトをインストール
```
brew bundle --file '~/Brewfile'
```

終了したら bitwarden のログアウトを忘れずに
```
bw logout
```
### 7. google-japanese-ime の設定

- Mac を再起動 (再起動しないと設定できない)
- [環境設定] → [キーボード] → [入力ソース]を開く
  - 「Google 日本語入力」を追加
  - 「日本語 - ローマ字入力」を選択し、「英字」のチェックをオンにする (これで「ABC」が削除できるようになる)
  - 「+」をクリック → 言語から英語を選択し「英数（Google）」を追加する (これで「日本語 - ローマ字入力」が削除できるようになる)
- (必要であれば) 辞書のインポート・エクスポート
  - PC で辞書の編集 → 辞書のエクスポート (.txt になる) → .zip に圧縮して Google Drive に保存 → スマホで Google Drive からインポート