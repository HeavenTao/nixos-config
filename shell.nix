{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    fish
    zoxide
  ];
in {
  users.users.${userName}.packages = packages;
}
