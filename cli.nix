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
  ];
in {
  users.users.${args.userName}.packages = packages;
}
