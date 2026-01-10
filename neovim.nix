{
  userName,
  pkgs,
  ...
}: let
  #code
  codePackages = with pkgs; [
    llvmPackages_19.libcxxClang
    llvmPackages_19.clang-unwrapped
    # zig
    zig
    # dotnetCorePackages.dotnet_8.sdk
  ];

  # lsp packages
  lspPackages = with pkgs; [
    lua-language-server
    vue-language-server
    nil
    typescript-language-server
    vscode-langservers-extracted
    zls
    yaml-language-server
    vscode-extensions.vadimcn.vscode-lldb
    #bash
    bash-language-server
  ];
  # formatter packages
  formatterPackages = with pkgs; [
    alejandra # nix formatter
    nodePackages.prettier
    prettierd
    stylua
    yamlfmt
    shfmt
  ];

  #debugger
  debuggerPackages = with pkgs; [
    lldb_19
  ];
  #meger
  allPackages = [lspPackages formatterPackages codePackages debuggerPackages];
in {
  users.users.${userName}.packages = builtins.concatLists allPackages;
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
  };
  # environment.sessionVariables = {
  #   DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  # };
}
