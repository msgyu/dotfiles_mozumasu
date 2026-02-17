{ config, pkgs, ... }:
{
  # hostSpec configuration
  hostSpec = {
    hostName = "gyu";
    username = "gyu";
    dotfilesDir = "/Users/gyu/dotfiles-mozumasu";
    system = "aarch64-darwin";
    enableGUI = true;
  };

  # Hostname configuration
  networking.hostName = config.hostSpec.hostName;
  system.primaryUser = config.hostSpec.username;

  # User configuration
  users.users.${config.hostSpec.username} = {
    name = config.hostSpec.username;
    home = "/Users/${config.hostSpec.username}";
  };

  # gyu-specific packages
  environment.systemPackages = with pkgs; [
    # Add gyu-specific tools here
  ];
}
