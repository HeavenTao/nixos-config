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
  ];
in {
  users.users.${userName}.packages = packages;
}
