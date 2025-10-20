{userName}: {
  pkgs,
  lib,
  config,
  ...
}: {
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
