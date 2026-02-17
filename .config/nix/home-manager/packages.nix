{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # シェルツール
    bat
    eza
    fd
    fzf
    hyperfine
    ripgrep
    sheldon
    zoxide
    zsh-completions
    tree
    wget
    jq
    tlrc # tldr

    # Git 関連
    git
    gh
    ghq
    lazygit
    delta # git-delta
    tig
    gibo
    git-secrets
    lefthook
    czg

    # エディタ/ターミナル
    neovim
    starship
    tmux

    # 開発ツール
    stylua
    typos
    actionlint
    tree-sitter
    deno
    rumdl # Markdown linter
    nodejs # for Mason LSP servers
    go # for gopls etc.

    # ビルドツール
    cmake
    ninja

    # インフラ/DevOps
    awscli2
    aws-vault
    colima
    docker
    k6
    session-manager-plugin
    vhs
    # pre-commit # 一時的に無効化（swiftビルドエラー回避）

    # Python ツール
    uv

    # メディア処理
    ffmpeg
    imagemagick
    ghostscript

    # モニタリング/ユーティリティ
    bottom
    fastfetch
    gomi
    glow
    presenterm # Terminal slideshow
    yazi
    lazydocker
    skanehira-ghost # Background process manager
    version-lsp # Package version checker LSP
    yaskkserv2 # SKK server
    safe-chain # Block malicious packages

    # ネタ系
    cowsay
    cmatrix
    nyancat
    asciiquarium
    asciinema

    # その他
    translate-shell
    terminal-notifier
    nkf
    rename
    inetutils # telnet
  ];
}
