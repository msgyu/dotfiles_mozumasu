{ ... }:
{
  homebrew = {
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
