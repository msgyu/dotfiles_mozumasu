{ config, lib, ... }:
{
  homebrew = lib.mkIf (!config.hostSpec.isWork) {
    brews = [
      "session-manager-plugin"
    ];

    # Personal-only casks
    casks = [
      # Window management
      "dockdoor"
      "jordanbaird-ice"
      "shortcat"

      # Terminals
      "alacritty"
      "iterm2"
      "kitty"
      "warp"

      # Development
      "cursor"
      "dbeaver-community"
      "postman"
      "visual-studio-code"

      # Productivity (raycast is in common homebrew.nix)
      "anki"
      "claude"
      "figma"

      # Communication
      "chatwork"
      "zoom"

      # System utilities
      "istat-menus"
      "keycastr"
      "sf-symbols"

      # Virtualization
      "multipass"
      "vagrant"

      # Media
      "spotify"

      # Other
      "android-file-transfer"
      "clip-studio-paint"
    ];
  };
}
