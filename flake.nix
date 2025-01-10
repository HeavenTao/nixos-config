{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixos-wsl.url= "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs ,nixos-wsl }: {
  	nixosConfigurations={
		wsl=nixpkgs.lib.nixosSystem {
			system= "x86_64-linux";
			modules = [
			   ./configuration.nix
			   nixos-wsl.nixosModules.default
			   {
			      system.stateVersion= "24.11";
			      wsl.enable=true;
			   }
			];
		};
	};	
  };
}
