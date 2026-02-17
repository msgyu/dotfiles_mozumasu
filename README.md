![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)<!-- markdownlint-disable-line -->

# Dotfiles

<img src="images/settings.gif" alt="settings" width="850"/>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## ![Alt](https://repobeats.axiom.co/api/embed/d195a3f40c76c2bedc77aaa70f5c15cb9966cc7b.svg "Repobeats analytics image")

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Tools

- terminal: [wezterm](https://wezfurlong.org/wezterm/index.html)
- shell: [zsh](https://www.zsh.org/)
- editor: [Neovim](https://neovim.io/)

  <img src="images/Neovim.png" alt="Neovim" width="850"/>

### Settings

- wezterm  
  [.config/wezterm](https://github.com/msgyu/dotfiles_mozumasu/tree/main/.config/wezterm)
- zsh  
  [.config/zsh](https://github.com/msgyu/dotfiles_mozumasu/tree/main/.config/zsh)
- Neovim  
  [.config/nvim](https://github.com/msgyu/dotfiles_mozumasu/tree/main/.config/nvim)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Articles

- [💘How to setup wezterm](https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization)

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

## Setup (New Mac)

### Prerequisites

- macOS (Apple Silicon)
- Git (インストールとGitHub認証設定まで)

#### GitHub SSHセットアップ（Homebrew taps用）

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

### Installation

#### Bootstrap (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/msgyu/dotfiles_mozumasu/main/bootstrap.sh | bash
```

#### Manual

```bash
# 0. (Optional) Ensure LocalHostName matches flake host
# Example: sudo scutil --set LocalHostName gyu

# 1. Install Nix
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

# 2. Set dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# 3. Clone dotfiles (use nix-shell if git is not installed)
nix-shell -p git --run "git clone https://github.com/msgyu/dotfiles_mozumasu $DOTFILES_DIR"

# 4. Backup existing shell configs (first time only)
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin

# 5. Homebrew taps はSSHで取得
export HOMEBREW_GIT_PROTOCOL=ssh

# 6. Apply nix-darwin configuration (first time)
HOSTNAME=$(scutil --get LocalHostName)
sudo --preserve-env=HOMEBREW_GIT_PROTOCOL nix run \
  --extra-experimental-features nix-command \
  --extra-experimental-features flakes \
  nix-darwin -- switch --flake "$DOTFILES_DIR/.config/nix#$HOSTNAME"

# After initial setup, use:
# nix-switch (or darwin-rebuild switch --flake $DOTFILES_DIR/.config/nix#$HOSTNAME)
```

> Homebrew is automatically installed via [nix-homebrew](https://github.com/zhaofengli/nix-homebrew)
> (GUI apps only; CLI tools are managed by Nix).

> Note: Tap installs require GitHub authentication. Prepare SSH keys or a PAT beforehand.

> Nix community cache is enabled for faster installs.

### Available Hosts

| Host | Description |
|------|-------------|
| `geisha` | Main Mac |
| `bourbon` | Second Mac |
| `gyu` | Personal Mac |

### What's Managed by Nix

| Category | Description |
|----------|-------------|
| **Homebrew** | Auto-installed via nix-homebrew (GUI apps only) |
| **CLI Tools** | Packages via home-manager |
| **GUI Apps** | Casks via Homebrew |
| **Dotfiles** | nvim, zsh, wezterm, karabiner, etc. |
| **macOS Settings** | Dock, Finder, Keyboard, Trackpad, etc. |

### Manual Setup Required

| Item | Reason |
|------|--------|
| Apple ID | Security |
| App Logins | Authentication |
| SSH Keys | `~/.ssh/` not managed |
| AWS/Git Credentials | Sensitive data |
| Karabiner Permissions | Accessibility permissions |

### Daily Commands

```bash
# Apply configuration changes
nix-switch

# Update flake inputs
nfu

# Garbage collection
ngc
```

> ホスト名の自動判定に失敗する場合は、`NIX_HOSTNAME` を設定してください。

---

## Commit Message

```sh
npx czg --api-endpoint="https://models.inference.ai.azure.com" --api-model="gpt-4o-mini"
```

> [OpenAI | cz-git](https://cz-git.qbb.sh/recipes/openai)
