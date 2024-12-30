# 移行前

### パッケージ類を最新にする

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

</details>

# 以降後

### 1. 初期セットアップ

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply kmr0831
```

### 2. chezmoi と bitwarden-cli インストール

> [!NOTE]
> TODO: 手順 2 以降は変更する

```
brew install chezmoi bitwarden-cli
```

### 3. bitwarden にログイン

[API key](https://bitwarden.com/ja-jp/help/personal-api-key/)

```
bw login --apikey
```

```
bw unlock
```

`bw unlock` すると `BW_SESSION` が発行されターミナルに表示されるので環境変数に入れる

```
export BW_SESSION="xxxxx"
```

```
bw sync
```

### 4. chezmoi を実行

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply kmr0831
```

`chezmoi init` で https 接続になっているので ssh 接続に変更する

```
git remote -v
git remote set-url origin git@github.com:kmr0831/dotfiles.git
ssh -T git@github.com
git remote -v
```

終了したら bitwarden のログアウトを忘れずに

```
bw logout
```

### 5. google-japanese-ime の設定

- Mac を再起動 (再起動しないと設定できない)
- 「環境設定」→「キーボード」→「入力ソース」を開く
  - 「Google 日本語入力」を追加
  - 「日本語 - ローマ字入力」を選択し、「英字」のチェックをオンにする (これで「ABC」が削除できるようになる)
  - 「+」をクリック → 言語から英語を選択し「英数（Google）」を追加する (これで「日本語 - ローマ字入力」が削除できるようになる)
- (必要であれば) 辞書のインポート・エクスポート
  - PC で辞書の編集 → 辞書のエクスポート (.txt になる) → .zip に圧縮して Google Drive に保存 → スマホで Google Drive からインポート

### 6. Raycast の設定

- Raycast の設定ファイルをインポートする。(設定ファイルを自動で読み込んでくれないため、手動でインポート作業が必要)

### 7. Mac 本体の設定

1. トラックパッドのスピード
    - 「システム環境設定」→「トラックパッド」→「ポイントとクリック」→「軌跡の速さ」を最速にする
2. 「タップでクリック」を有効にする
    - 「システム環境設定」→「トラックパッド」→「ポイントとクリック」→「タップでクリック」を ON
3. ランチャーのショートカットを Raycast に変える
    - 「システム環境設定」→「キーボード」→「ショートカット」→「Spotlight」→「Spotlight 検索を表示」を OFF
4. Finder のカスタマイズ
    - 「環境設定」→「一般」→「新規 Finder ウィンドウ」をホームディレクトリにする
    - 「環境設定」→「一般」→「デスクトップに表示する項目」をすべて OFF
    - 「環境設定」→「詳細」→「すべてのファイル名拡張子を表示」を ON
    - メニューバーの「表示」→「パスバーを表示」「ステータスバーを表示」を ON
    - 「shift + command + .」で隠しフォルダを表示 → ゴミ箱をサイドバーにドラッグアンドドロップ
5. Dock のカスタマイズ
    - 「Dockを自動的に表示／非表示」を ON
    - 「最近使用したアプリをDockに表示」を OFF
    - 「Finder」「システム環境設定」「Google Chrome」「Warp」「VS Code」「Raycast」
6. メニューバー
    - 「Bluetooth」を ON
    - 「バッテリー」「% を表示」を ON
    - 「時計」「秒を表示」を ON
    - 「Spotlight」を OFF
7. ディスプレイの「輝度を自動調節」をオフにする
8. Mission Control
    - 「ディスプレイごとに個別の操作スペース」「ドラッグして Mission Control に入る」以外をすべて OFF
      - ウィンドウが勝手に並び替えられるから
