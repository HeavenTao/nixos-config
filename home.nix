{
  pkgs,
  lib,
  config,
  ...
}: {
  # cli
  # zsh
  home.file.".zshrc" = {
    source = ./config/zsh/zshrc;
  };
  home.file.".zimrc" = {
    source = ./config/zsh/zimrc;
  };

  # tmux
  home.file.".tmux.conf" = {
    source = ./config/tmux/tmux.conf;
  };

  #windows
  # niri
  home.file.".config/niri/config.kdl" = {
    source = ./config/niri/config.kdl;
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

  #kitty
  home.file.".config/kitty/kitty.conf" = {
    source = ./config/kitty/kitty.conf;
  };
  home.file.".config/kitty/kitty.conf.bak" = {
    source = ./config/kitty/kitty.conf.bak;
  };
  home.file.".config/kitty/current-theme.conf" = {
    source = ./config/kitty/current-theme.conf;
  };

  # ssh git
  home.file.".ssh/config" = {
    source = ./config/ssh/config;
  };

  # wallpapers
  home.file.".config/wallpapers/bg.jpeg" = {
    source = ./wallpapers/bg.jpeg;
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
