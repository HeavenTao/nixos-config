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
    mihomo
  ];
in {
  users.users.${userName}.packages = packages;
  networking.proxy.default = "http://127.0.0.1:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost,.localdomain";
  services.mihomo = {
    enable = true;
    # 安装好之后，Controy.mmdb文件需要自己copy到指定目录，这个目录需要看它的服务是从什么地方加载的
    configFile = /home/ht/.config/mihomo/config.yaml;
    webui = pkgs.metacubexd;
    tunMode = false;
  };
}
