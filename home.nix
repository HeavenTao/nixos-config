{
  pkgs,
  lib,
  config,
  ...
}: let
  path = /home/ht/.config/nixos-config;
in {
  #cli
  # zsh
  home.file.".zshrc" = {
    source = config.lib.file.mkOutOfStoreSymlink (path + /config/zsh/zshrc);
  };
  home.file.".zimrc" = {
    source = config.lib.file.mkOutOfStoreSymlink (path + /config/zsh/zimrc);
  };
  home.file.".config/zsh/docker_zsh" = {
    source = ./config/zsh/docker_zsh;
  };

  # tmux
  home.file.".tmux.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink (path + /config/tmux/tmux.conf);
  };

  #iflow
  home.file.".iflow" = {
    source = config.lib.file.mkOutOfStoreSymlink (path + ./config/iflow);
    recursive = true;
  };

  #windows
  # niri
  # home.file.".config/niri/config.kdl" = {
  #   source = ./config/niri/config.kdl;
  # };
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
    source = config.lib.file.mkOutOfStoreSymlink (path + /config/kitty/kitty.conf);
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
  home.file.".config/wallpapers/bg2.png" = {
    source = ./wallpapers/bg2.png;
  };

  # river
  home.file.".config/river/init" = {
    source = config.lib.file.mkOutOfStoreSymlink (path + /config/river/init);
  };

  # waybar
  home.file.".config/waybar/config.jsonc" = {
    source = config.lib.file.mkOutOfStoreSymlink (path + /config/waybar/config.jsonc);
  };
  home.file.".config/waybar/style.css" = {
    source = config.lib.file.mkOutOfStoreSymlink (path + /config/waybar/style.css);
  };

  # cursor
  home.file.".icons/" = {
    source = ./config/cursor;
    recursive = true;
  };

  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;
}
