{userName}: {
  pkgs,
  lib,
  config,
  ...
}: {
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
