{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    fish
    zsh
  ];
in {
  users.users.${userName}.packages = packages;
}
