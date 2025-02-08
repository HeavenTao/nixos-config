{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
  ];
in {
  users.users.${userName}.packages = packages;
}
