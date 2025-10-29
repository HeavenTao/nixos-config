{
  pkgsUnstable,
  userName,
  pkgs,
  ...
}: let
  #code
  codePackages = with pkgs; [
    llvmPackages_19.libcxxClang
    llvmPackages_19.clang-unwrapped
    # zig
    pkgsUnstable.zig_0_15
    # dotnetCorePackages.dotnet_8.sdk
  ];

  # lsp packages
  lspPackages = with pkgs; [
    yaml-language-server
    lua-language-server
    vue-language-server
    pkgsUnstable.nil
    typescript-language-server
    vscode-langservers-extracted
    bash-language-server
    # zls
    pkgsUnstable.zls_0_15
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
    package = pkgsUnstable.neovim-unwrapped;
  };
  # environment.sessionVariables = {
  #   DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  # };
}
