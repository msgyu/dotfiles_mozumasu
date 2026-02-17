{ ... }:
{
  # Basic Homebrew settings (packages are defined in hosts/common/homebrew.nix)
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    taps = [
      "arto-app/tap"
      "d12frosted/emacs-plus"
      "felixkratz/formulae"
      "ghostty-org/ghostty"
      "homebrew/cask-fonts"
      "mtgto/macskk"
      "nikitabobko/tap"
      "olets/tap"
      "sh0nk/tap"
      "shu-pf/tap"
      "timac/vpnstatus"
      "wez/wezterm-nightly"
      "xwmx/taps"
    ];
  };
}
