{...} @ args: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    git
    lazygit
    ripgrep
    fd
    fzf
    bat
    eza
    file
    tmux
    yazi
    btop
    # mdbook #markdown edit server
    # lnav
    zip
    unzip
    #domain name server
    #dig @8.8.8.8 google.com
    # dig
    translate-shell
    zoxide
  ];
in {
  users.users.${args.userName}.packages = packages;
}
