{...} @ args: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    git
    ripgrep
    lazygit
    fzf
    bat
    eza
    file
    tmux
    yazi
    btop
    mdbook #markdown edit server
    lnav
    zip
    unzip
    #domain name server
    #dig @8.8.8.8 google.com
    dig
  ];
in {
  users.users.${args.userName}.packages = packages;
}
