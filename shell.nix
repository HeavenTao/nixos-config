{
  userName,
  pkgs,
  ...
}: let
  packages = with pkgs; [
    zsh
  ];
in {
  users.users.${userName}.packages = packages;
}
