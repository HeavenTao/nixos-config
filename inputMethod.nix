# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{userName}: {
  config,
  lib,
  pkgs,
  ...
}: let
  packages = with pkgs; [
  ];
in {
  users.users.${userName}.packages = packages;
  # environment.variables = {
  #   GLFW_IM_MODULE = "fcitx";
  #   GTK_IM_MODULE = "fctix";
  #   INPUT_METHOD = "fcitx";
  #   XMODIFIERS = "@im=fcitx";
  #   IMSETTINGS_MODULE = "fcitx";
  #   QT_IM_MODULE = "fcitx";
  #   SDL_IM_MODULE = "fctix";
  # };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        rime-zhwiki
        rime-data
        fcitx5-rime
        # librime
        # fcitx5-chinese-addons
        fcitx5-configtool
        fcitx5-gtk
        # fcitx5-skk-qt
      ];
    };
  };
}
