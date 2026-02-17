{ ... }:
{
  nix.settings = {
    experimental-features = "nix-command flakes";
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qfJ76k2prvD0bE69Im9wFQ1lV3rC5VgY9f9I="
    ];
  };
  nixpkgs.config.allowUnfree = true;
}
