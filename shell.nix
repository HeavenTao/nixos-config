{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    fish
  ];
in {
  users.users.${userName}.packages = packages;
  # Fish 安装插件管理器 并安装插件

  # curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

  # fisher install jorgebucaran/fisher
  # fisher install IlanCosman/tide@v6
  # fisher install jorgebucaran/autopair.fish
}
