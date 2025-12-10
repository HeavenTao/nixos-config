# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  userName,
  pkgs,
  ...
}: let
  packages = [
  ];
in {
  users.users.${userName}.packages = packages;
  # environment.variables = {
  #   GLFW_IM_MODULE = "fcitx";
  #   GTK_IM_MODULE = "fctix";
  #   INPUT_METHOD = "fcitx";
  #   XMODIFIERS = "@im=fcitx";
  #   IMSETTINGS_MODULE = "fcitx";
  #   QT_IM_MODULE = "fcitx";
  #   SDL_IM_MODULE = "fctix";
  # };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        # rime-zhwiki
        # rime-data
        # rime的数据目录在/home/ht/.local/share/fcitx5/rime下
        # build为自动生成目录，不需要手动调整
        # 输入法安装在rime目录下，通过*.custom.yaml覆盖修改
        # 想要简单的安装就使用东风破插件进行
        # rime_frontend=fcitx5-rime bash rime-install iDevl/rime-ice:others/recipes/full
        # 安装完成之后的重启通过fcitx5-remote -r进行
        fcitx5-rime
        librime
        # fcitx5-chinese-addons
        qt6Packages.fcitx5-configtool
        # fcitx5-gtk
        # fcitx5-skk-qt
      ];
    };
  };
}
