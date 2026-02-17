{ config, ... }:
{
  services.kanata = {
    enable = false; # Karabinerで管理するため無効化
    keyboards = {
      macbook = {
        configFile = "${config.hostSpec.dotfilesDir}/.config/kanata/macbook.kbd";
        port = 5829;
      };
      external = {
        configFile = "${config.hostSpec.dotfilesDir}/.config/kanata/external.kbd";
        port = 5830;
      };
    };
  };
}
