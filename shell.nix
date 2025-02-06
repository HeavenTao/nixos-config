{
  userName,
  fisherEnable ? false,
  installScript,
}: {
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
  system.activationScripts.fisherInstall = lib.mkIf fisherEnable ''
    echo "Install fisher"
    export http_proxy=http://192.168.3.4:7890
    export https_proxy=http://192.168.3.4:7890
    export PATH=${pkgs.gnutar}/bin:${pkgs.curl}/bin:${pkgs.fish}/bin:${pkgs.gzip}/bin:$PATH
    export fisher_path=/home/${userName}/.config/fish
    fish -c "source ${installScript} && fisher install jorgebucaran/fisher && fisher install IlanCosman/tide@v6"
  '';
}
