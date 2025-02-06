{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file.".config/fish/config.fish" = {
    source = ./config/fish/config.fish;
  };
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
