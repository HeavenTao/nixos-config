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
  system.activationScripts = lib.mkIf fisherEnable ''
    echo "Install fisher"
    export PATH=${pkgs.gnutar}/bin:${pkgs.curl}/bin:${pkgs.fish}/bin:$PATH
    fish -c "source ${installScript} && fisher install jorgebucaran/fisher"
  '';
}
