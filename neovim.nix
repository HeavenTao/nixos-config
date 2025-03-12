{...} @ args: {
  lib,
  pkgs,
  config,
  ...
}: let
  #code
  codePackages = with pkgs; [
    llvmPackages_19.libcxxClang
    llvmPackages_19.clang-unwrapped
    # zig
    args.pkgsUnstable.zig
  ];

  # lsp packages
  lspPackages = with pkgs; [
    lua-language-server
    vue-language-server
    nixd
    typescript-language-server
    vscode-langservers-extracted
    args.zlsPackages.packages.${args.system}.zls
  ];
  # formatter packages
  formatterPackages = with pkgs; [
    alejandra # nix formatter
    nodePackages.prettier
    prettierd
    stylua
  ];
  #meger
  allPackages = [lspPackages formatterPackages codePackages];
in {
  users.users.${args.userName}.packages = builtins.concatLists allPackages;
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    defaultEditor = true;
  };
}
