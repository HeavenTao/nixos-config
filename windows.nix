{
  userName,
  pkgs,
  ...
}: let
  packages = with pkgs; [
    #terminal
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
    wl-clipboard
    wmenu
    wbg
    wlr-randr
    waybar
    wev
    filezilla
  ];
in {
  environment.sessionVariables = {
    #wayland vscode
    NIXOS_OZONE_WL = 1;
    # https_proxy = "http://127.0.0.1:7890";
    # http_proxy = "http://127.0.0.1:7890";
  };
  users.users.${userName}.packages = packages;
  services.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;

  # virtualisation.virtualbox.host.enable = true;

  fonts.packages = with pkgs; [
    maple-mono.Normal-NF-CN-unhinted
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.noto
  ];
}
