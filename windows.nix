{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    alacritty
    ghostty
  ];
in {
  users.users.${userName}.packages = packages;
  services.xserver.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };
  programs.niri.enable = true;
}
