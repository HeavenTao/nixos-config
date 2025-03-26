{userName}: {
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
  ];
in {
  users.users.${userName}.packages = packages;
}
