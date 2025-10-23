{
  userName,
  pkgs,
  ...
}: let
  packages = with pkgs; [
    tldr
    git
    lazygit
    ripgrep
    fd
    fzf
    bat
    eza
    file
    tmux
    # yazi
    lf
    btop
    # mdbook #markdown edit server
    # lnav
    zip
    unzip
    p7zip
    unrar
    #domain name server
    #dig @8.8.8.8 google.com
    # dig
    translate-shell
    zoxide
    #ftp client
    ncftp
    #fs system
    exfat
    ntfs3g
  ];
in {
  users.users.${userName}.packages = packages;
  virtualisation.docker = {
    enable = true;
  };
}
