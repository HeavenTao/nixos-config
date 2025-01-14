{
  pkgs,
  lib,
  config,
  ...
}: {
  users.users.ht = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    packages = with pkgs; [
      neovim
      git
      lua-language-server
      nixd
      alejandra
      llvmPackages_19.libcxxClang
      lazygit
      fish
    ];
  };
}
