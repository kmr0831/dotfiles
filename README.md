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
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --purge-binary --apply kmr0831
```

オプション

| key             | value               |
| --------------- | ------------------- |
| BITWARDEN_EMAIL | bitwarden email     |

終了したら bitwarden のログアウトを忘れずに

```
bw logout
```

### 2. google-japanese-ime の設定

- Mac を再起動 (再起動しないと設定できない)
- 「環境設定」→「キーボード」→「入力ソース」を開く
  - 「Google 日本語入力」を追加
  - 「日本語 - ローマ字入力」を選択し、「英字」のチェックをオンにする (これで「ABC」が削除できるようになる)
  - 「+」をクリック → 言語から英語を選択し「英数（Google）」を追加する (これで「日本語 - ローマ字入力」が削除できるようになる)
- (必要であれば) 辞書のインポート・エクスポート
  - PC で辞書の編集 → 辞書のエクスポート (.txt になる) → .zip に圧縮して Google Drive に保存 → スマホで Google Drive からインポート

### 3. Raycast の設定

- Raycast の設定ファイルをインポートする。(設定ファイルを自動で読み込んでくれないため、手動でインポート作業が必要)

### 4. Mac 本体の設定

defaults で、設定できない/設定方法がわからなかった項目のカスタマイズを行う

1. Finder のカスタマイズ
    - ゴミ箱をサイドバーにドラッグアンドドロップ
2. Dock のカスタマイズ
    - 「Finder」「システム環境設定」「Google Chrome」「Warp」「VS Code」「Raycast」
3. メニューバー
    - 「Spotlight」を OFF
4. ディスプレイの「輝度を自動調節」をオフにする
