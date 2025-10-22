# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  isInWsl,
  config,
  lib,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  imports =
    if isInWsl
    then []
    else [/etc/nixos/hardware-configuration.nix];
  boot.loader.systemd-boot.enable = !isInWsl;
  boot.loader.efi.canTouchEfiVariables = !isInWsl;
  services.openssh.enable = !isInWsl;
  networking.nameservers = [
    "8.8.8.8"
  ];
  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "25.05";
}
