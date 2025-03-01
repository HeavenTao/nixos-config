{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    alacritty
    ghostty
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })
  ];
in {
  users.users.${userName}.packages = packages;
  services.xserver.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };
  programs.niri.enable = true;
}
