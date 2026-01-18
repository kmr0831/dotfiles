# dotfiles

[chezmoi](https://www.chezmoi.io/) と [Nix](https://nixos.org/) で管理されている dotfiles です

## Setup

[Bitwarden](https://bitwarden.com/) を使って秘密鍵を管理しています。<br>
オプションとして、Bitwarden CLI でログインする際のメールアドレスを環境変数に設定しておくことができます。

| key             | value               |
| --------------- | ------------------- |
| BITWARDEN_EMAIL | bitwarden email     |

### Linux / macOS / WSL

```bash
export BITWARDEN_EMAIL="example@example.com"
```

### Windows

```ps1
$env:BITWARDEN_EMAIL = "example@example.com"
```

## Linux / macOS / WSL

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --purge-binary --apply kmr0831
nix run home-manager/master -- switch --flake .#gin
```

```bash
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

```bash
git remote set-url origin git@github.com:kmr0831/dotfiles.git
```

## Windows (PowerShell)

```ps1
iex "&{$(irm 'https://get.chezmoi.io/ps1')} init --purge-binary --apply kmr0831"
```

## Daily operations

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

## Other Settings

### macOS

#### 1. google-japanese-ime の設定

- Mac を再起動 (再起動しないと設定できない)
- 「環境設定」→「キーボード」→「入力ソース」を開く
  - 「Google 日本語入力」を追加
  - 「日本語 - ローマ字入力」を選択し、「英字」のチェックをオンにする (これで「ABC」が削除できるようになる)
  - 「+」をクリック → 言語から英語を選択し「英数（Google）」を追加する (これで「日本語 - ローマ字入力」が削除できるようになる)
- (必要であれば) 辞書のインポート・エクスポート
  - PC で辞書の編集 → 辞書のエクスポート (.txt になる) → .zip に圧縮して Google Drive に保存 → スマホで Google Drive からインポート

#### 2. Raycast の設定

- Raycast の設定ファイルをインポートする。(設定ファイルを自動で読み込んでくれないため、手動でインポート作業が必要)

#### 3. Mac 本体の設定

defaults で、設定できない/設定方法がわからなかった項目のカスタマイズを行う

1. Finder のカスタマイズ
    - ゴミ箱をサイドバーにドラッグアンドドロップ
2. Dock のカスタマイズ
    - 「Finder」「システム環境設定」「Google Chrome」「Warp」「VS Code」「Raycast」
3. メニューバー
    - 「Spotlight」を OFF
4. ディスプレイの「輝度を自動調節」をオフにする

## Notes

### chezmoi メモ

- `hooks.apply.pre` → `hooks.read-source-state.pre` → `run_before_` script の順に呼ばれる
  - `hooks.read-source-state.pre` は chezmoi コマンド (apply, diff, data 等) の実行時に毎回呼ばれる
- `BW_SESSION` が環境変数に設定してあっても、chezmoi コマンドを実行しているターミナルウィンドウで `bw login` しないと毎回マスターパスワードを聞かれる
  - `bw login` → `export BW_SESSION="xxx"` → `chezmoi diff/apply` → マスターパスワードの入力なしで OK
  - `chezmoi diff/apply` → シェルスクリプト内で `bw login` → `export BW_SESSION="xxx"` しても毎回マスターパスワードの入力が求められる
    - chezmoi コマンドを実行しているターミナルウィンドウで `bw login` しない限り、何度 `bw unlock` してもマスターパスワードの入力が必要
