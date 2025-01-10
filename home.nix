{pkgs,lib,config,...}:

{
	home.username="nixos";	
	home.homeDirectory="/home/nixos/";
	
	home.file.".config/nvim/test.txt" = {
		source = ./nvim/test.txt;
	};

	home.stateVersion="24.11";
	programs.home-manager.enable = true;
}
