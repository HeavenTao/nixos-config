# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{userName}: {
  config,
  lib,
  pkgs,
  ...
}: let
  packages = with pkgs; [
    gui-for-clash
  ];
in {
  users.users.${userName}.packages = packages;
  networking.proxy.default = "http://127.0.0.1:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost,.localdomain";
}
