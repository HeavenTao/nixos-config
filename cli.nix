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
    zellij
  ];
in {
  users.users.${userName}.packages = packages;
}
