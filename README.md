![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)<!-- markdownlint-disable-line -->

# Dotfiles

<img src="images/settings.gif" alt="settings" width="850"/>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## ![Alt](https://repobeats.axiom.co/api/embed/d195a3f40c76c2bedc77aaa70f5c15cb9966cc7b.svg "Repobeats analytics image")

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## ツール

- ターミナル: [wezterm](https://wezfurlong.org/wezterm/index.html)
- シェル: [zsh](https://www.zsh.org/)
- エディタ: [Neovim](https://neovim.io/)

  <img src="images/Neovim.png" alt="Neovim" width="850"/>

### 設定

- wezterm  
  [.config/wezterm](https://github.com/msgyu/dotfiles_mozumasu/tree/main/.config/wezterm)
- zsh  
  [.config/zsh](https://github.com/msgyu/dotfiles_mozumasu/tree/main/.config/zsh)
- Neovim  
  [.config/nvim](https://github.com/msgyu/dotfiles_mozumasu/tree/main/.config/nvim)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## 記事

- [💘weztermのセットアップ方法](https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization)

```text


                               .---\         "MMMMN,     #MM#.
                              /     \         "MMMMM,   MMMMM7
                               \     \         "MMMMM,vMMMMM"
                                \     \         "MMMMMMMMMM"
                          .------?     4--------\"MMMMMMMM"
                         /                       \"MMMMM4      /\
                        /_________________________\"MMMMM.    /  \
                                .MMMMM"             "MMMMM.  /    \
                               .MMMMM"               "MMMMM,/      /
                              .MMMMM"                 "MMMM/      /
                             .MMMMM"                   "MM/      /
                    MMMMMMMMMMMMMM"                     "/      4------.
                   pMMMMMMMMMMMMM",                     /               '
                    NMMMMMMMMMMM"/ \                   /      _________/
                         ,#MMMM"/   \                 /      /
                        ,MMMMM"/     \               /      /
                       "MMMMM"  \     \             /______/
                        "MMM"    \     \"MMMMMMMMMMMMMMMMMMMMMMMMMP
                         "M"     /      \"MMMMMMMMMMMMMMMMMMMMMMMP
                          "     /        \"MMMMMMMMMMMMMMMMMMMMMP
                               /          \         "NMMMM,
                              /     /\     \         "NMMMMM
                             4     /  \     \         "NMMMM"
                              \___/    \_____\         "NMM"

                                     ███╗   ██╗██╗██╗  ██╗
                                     ████╗  ██║██║╚██╗██╔╝
                                     ██╔██╗ ██║██║ ╚███╔╝
                                     ██║╚██╗██║██║ ██╔██╗
                                     ██║ ╚████║██║██╔╝╚██╗
                                     ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝

```

---

## セットアップ（新しいMac）

### 前提条件

- macOS (Apple Silicon)
- Git（インストールとGitHub認証設定まで）

#### GitHub SSHセットアップ（Homebrew tap用）

```bash
# SSH鍵を作成
ssh-keygen -t ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519

# ssh-agent に登録（macOS）
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# GitHub用にSSH設定を追加
cat >> ~/.ssh/config <<'EOF'
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF

# 公開鍵をコピーしてGitHubに登録（Settings → SSH and GPG keys）
pbcopy < ~/.ssh/id_ed25519.pub

# 接続確認
ssh -T git@github.com
```

### インストール

#### Bootstrap（推奨）

```bash
curl -fsSL https://raw.githubusercontent.com/msgyu/dotfiles_mozumasu/main/bootstrap.sh | bash
```

#### 手動

```bash
# 0. （任意）LocalHostName を flake のホスト名に合わせる
# 例: sudo scutil --set LocalHostName gyu

# 1. Nixをインストール
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

# 2. dotfilesディレクトリを設定
DOTFILES_DIR="$HOME/dotfiles"

# 3. dotfilesをクローン（gitが無ければnix-shellを使用）
nix-shell -p git --run "git clone https://github.com/msgyu/dotfiles_mozumasu $DOTFILES_DIR"

# 4. 既存のシェル設定をバックアップ（初回のみ）
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin

# 5. Homebrew tap はSSHで取得
export HOMEBREW_GIT_PROTOCOL=ssh

# 6. nix-darwin設定を適用（初回）
HOSTNAME=$(scutil --get LocalHostName)
sudo --preserve-env=HOMEBREW_GIT_PROTOCOL nix run \
  --extra-experimental-features nix-command \
  --extra-experimental-features flakes \
  nix-darwin -- switch --flake "$DOTFILES_DIR/.config/nix#$HOSTNAME"

# 初回セットアップ後は以下を使用:
# nix-switch（または darwin-rebuild switch --flake $DOTFILES_DIR/.config/nix#$HOSTNAME）
```

> Homebrew は [nix-homebrew](https://github.com/zhaofengli/nix-homebrew) により自動インストールされます
>（GUIアプリのみ。CLIツールはNix管理）。

> Tap の取得には GitHub 認証が必要です。事前に SSH 鍵または PAT を準備してください。

> Nix community cache を有効化してインストールを高速化しています。

### 利用可能なホスト

| ホスト | 説明 |
|------|------|
| `geisha` | メインMac |
| `bourbon` | サブMac |
| `gyu` | 個人Mac |

### Nixで管理しているもの

| カテゴリ | 説明 |
|----------|------|
| **Homebrew** | nix-homebrew で自動インストール（GUIアプリのみ） |
| **CLIツール** | home-manager で管理 |
| **GUIアプリ** | Homebrew の cask で管理 |
| **Dotfiles** | nvim, zsh, wezterm, karabiner など |
| **macOS設定** | Dock, Finder, Keyboard, Trackpad など |

### 手動設定が必要なもの

| 項目 | 理由 |
|------|------|
| Apple ID | セキュリティ |
| アプリのログイン | 認証情報 |
| SSH鍵 | `~/.ssh/` は未管理 |
| AWS/Git 認証 | 機密情報 |
| Karabiner 権限 | アクセシビリティ権限 |

### 日常コマンド

```bash
# 設定の適用
nix-switch

# flake入力の更新
nfu

# ガベージコレクション
ngc
```

> ホスト名の自動判定に失敗する場合は、`NIX_HOSTNAME` を設定してください。

---

## コミットメッセージ

```sh
npx czg --api-endpoint="https://models.inference.ai.azure.com" --api-model="gpt-4o-mini"
```

> [OpenAI | cz-git](https://cz-git.qbb.sh/recipes/openai)
