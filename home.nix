{
  pkgs,
  lib,
  config,
  ...
}: {
  # fish
  home.file.".config/fish/config.fish" = {
    source = ./config/fish/config.fish;
  };
  # niri
  home.file.".config/niri/config.kdl" = {
    source = ./config/niri/config.kdl;
  };
  # tmux
  home.file.".tmux.conf" = {
    source = ./config/tmux/.tmux.conf;
  };
  # ghostty
  home.file.".config/ghostty/config" = {
    source = ./config/ghostty/config;
  };
  # rofi
  home.file.".config/rofi/config.rasi" = {
    source = ./config/rofi/config.rasi;
  };
  home.file.".config/rofi/gruvbox-dark-hard.rasi" = {
    source = ./config/rofi/gruvbox-dark-hard.rasi;
  };
  # fcitx5
  home.file.".local/share/fcitx5/themes/macOS-dark" = {
    source = ./config/fcitx5/themes/macOS-dark;
    recursive = true;
  };
  home.file.".local/share/fcitx5/themes/winter" = {
    source = ./config/fcitx5/themes/winter;
    recursive = true;
  };
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
