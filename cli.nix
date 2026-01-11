{
  userName,
  pkgs,
  ...
}: let
  packages = with pkgs; [
    tldr #simple man
    git
    lazygit #cligit
    ripgrep #content search
    fd #file finder
    fzf #search
    bat #cat
    eza #ls
    file #show file type
    tmux
    lf #cli file manager
    btop #cli system status
    zip
    unzip
    p7zip
    unrar
    translate-shell #translate
    zoxide #fast cd
    ncftp #ftp cli client
    exfat
    ntfs3g
    pandoc #doc type translate
    mdbook #markdown show
    fastfetch
    net-tools
    quickemu
    gnumake
    llama-cpp
    nodejs_24
    wget
  ];
in {
  users.users.${userName}.packages = packages;

  virtualisation.docker = {
    enable = true;
  };
}
