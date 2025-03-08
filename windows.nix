{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    #terminal
    # alacritty
    ghostty
    #browser
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })
    rofi-wayland
    wl-clipboard
  ];
in {
  users.users.${userName}.packages = packages;
  services.xserver.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };
  programs.niri.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    (nerdfonts.override {
      fonts = [
        "Noto"
      ];
    })
  ];
}
