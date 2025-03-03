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
  services.xserver.desktopManager.runXdgAutostartIfNone = false;
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-gtk
        fcitx5-configtool
      ];
    };
  };
}
