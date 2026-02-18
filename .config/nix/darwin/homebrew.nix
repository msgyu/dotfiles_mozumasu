{ ... }:
{
  # Basic Homebrew settings (packages are defined in hosts/common/homebrew.nix)
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

  };
}
