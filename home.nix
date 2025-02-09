{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file.".config/fish/config.fish" = {
    source = ./config/fish/config.fish;
  };
  home.file.".tmux.conf" = {
    source = ./config/tmux/.tmux.conf;
  };
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
