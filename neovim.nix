{userName}: {
  lib,
  pkgs,
  config,
  ...
}: let
  # lsp packages
  lspPackages = with pkgs; [
    lua-language-server
    vue-language-server
    nixd
    llvmPackages_19.libcxxClang
    llvmPackages_19.clang-unwrapped
    typescript-language-server
  ];

  # formatter packages
  formatterPackages = with pkgs; [
    alejandra
    nodePackages.prettier
    prettierd
    stylua
  ];
  #meger
  allPackages = [lspPackages formatterPackages];
in {
  users.users.${userName}.packages = builtins.concatLists allPackages;
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    defaultEditor = true;
  };
}
