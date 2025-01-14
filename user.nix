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
      git
      lua-language-server
      nixd
      alejandra
      llvmPackages_19.libcxxClang
      llvmPackages_19.clang-unwrapped
      nodePackages.prettier
      prettierd
      stylua
      ripgrep
      lazygit
      fish
      zoxide
    ];
  };
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    defaultEditor = true;
  };
}
