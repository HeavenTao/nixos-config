{
  userName,
  pkgsUnstable,
  pkgs,
  ...
}: let
  packages = with pkgs; [
    #terminal
    # pkgsUnstable.ghostty
    kitty
    #browser
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

    amule
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

  # programs.river.enable = true;

  # virtualisation.virtualbox.host.enable = true;

  fonts.packages = with pkgs; [
    pkgsUnstable.maple-mono.Normal-NF-CN-unhinted
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.noto
  ];
}
