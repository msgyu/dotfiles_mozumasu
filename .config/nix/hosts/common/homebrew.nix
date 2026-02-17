{ ... }:
{
  homebrew = {
    # Common brews for all hosts (work-essential tools)
    brews = [
      # Shell
      "sheldon" # for zeno.zsh
      "zsh-completions"

      # macOS specific
      "felixkratz/formulae/borders"
      "xwmx/taps/nb"
      "terminal-notifier"

      # Container runtime
      "docker"
      "colima"
    ];

    # Common casks for all hosts (work-essential apps)
    casks = [
      # Window management
      "nikitabobko/tap/aerospace"
      "alt-tab"
      "homerow"

      # Terminals
      "ghostty-org/ghostty/ghostty"
      "wez/wezterm-nightly/wezterm@nightly"

      # Browsers
      "arc"

      # System utilities
      "aws-vault-binary"
      "karabiner-elements"
      "shottr"

      # Input methods
      "mtgto/macskk/macskk"

      # Productivity
      "arto-app/tap/arto"
      "raycast"

      # Fonts (needed for terminals)
      "homebrew/cask-fonts/font-hackgen"
      "homebrew/cask-fonts/font-hackgen-nerd"
    ];
  };
}
