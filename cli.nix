{...} @ args: {
  lib,
  pkgs,
  config,
  ...
}: let
  packages = with pkgs; [
    git
    ripgrep
    lazygit
    fzf
    bat
    eza
    file
    tmux
    yazi
    btop
    mdbook #markdown edit server
    args.pkgsUnstable.lazyjournal
  ];
in {
  users.users.${args.userName}.packages = packages;
}
