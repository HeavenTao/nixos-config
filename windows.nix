{
  userName,
  pkgsUnstable,
}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    #terminal
    # alacritty
    # ghostty
    kitty

    #browser
    firefox
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })
    # rofi-wayland
    wl-clipboard
    wmenu

    #editor
    #vscode
    wbg
  ];
in {
  environment.sessionVariables = {
    #wayland vscode
    NIXOS_OZONE_WL = 1;
  };
  users.users.${userName}.packages = packages;
  services.xserver.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
  fonts.packages = with pkgs; [
    pkgsUnstable.maple-mono.Normal-NF-CN-unhinted
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.noto
  ];
}
