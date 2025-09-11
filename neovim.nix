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
    zig
    # args.pkgsUnstable.zig_0_15
    # dotnetCorePackages.dotnet_8.sdk
  ];

  # lsp packages
  lspPackages = with pkgs; [
    lua-language-server
    vue-language-server
    args.pkgsUnstable.nil
    typescript-language-server
    vscode-langservers-extracted
    zls
    # args.pkgsUnstable.zls_0_15
    yaml-language-server
    vscode-extensions.vadimcn.vscode-lldb
  ];
  # formatter packages
  formatterPackages = with pkgs; [
    alejandra # nix formatter
    nodePackages.prettier
    prettierd
    stylua
  ];

  #debugger
  debuggerPackages = with pkgs; [
    lldb_19
  ];
  #meger
  allPackages = [lspPackages formatterPackages codePackages debuggerPackages];
in {
  users.users.${args.userName}.packages = builtins.concatLists allPackages;
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    defaultEditor = true;
    package = args.pkgsUnstable.neovim-unwrapped;
  };
  # environment.sessionVariables = {
  #   DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  # };
}
