{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file.".config/fish/config.fish" = {
    source = ./config/fish/config.fish;
  };
  home.file.".config/niri/config.kdl" = {
    source = ./config/niri/config.kdl;
  };
  home.file.".tmux.conf" = {
    source = ./config/tmux/.tmux.conf;
  };
  home.file.".config/ghostty/config" = {
    source = ./config/ghostty/config;
  };
  home.file.".config/rofi/config.rasi" = {
    source = ./config/rofi/config.rasi;
  };
  home.file.".config/rofi/gruvbox-dark-hard.rasi" = {
    source = ./config/rofi/gruvbox-dark-hard.rasi;
  };
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
