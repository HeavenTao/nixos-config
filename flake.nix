{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    nixpkgs-unstable,
    home-manager,
  }: let
    system = "x86_64-linux";
    userName = "ht";
    pkgsUnstable = import nixpkgs-unstable {inherit system;};
  in {
    nixosConfigurations = {
      wsl = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          isInWsl = true;
          inherit userName;
          inherit pkgsUnstable;
        };
        modules = [
          ./configuration.nix
          ./neovim.nix
          ./shell.nix
          ./cli.nix
          ./user.nix
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "25.11";
            wsl.enable = true;
            wsl.defaultUser = userName;
            wsl.useWindowsDriver = true;
            wsl.interop.includePath = false;
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userName} = import ./home.nix;
          }
        ];
      };
      home = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          isInWsl = false;
          inherit userName;
          inherit pkgsUnstable;
        };
        modules = [
          ./inputMethod.nix
          ./configuration.nix
          ./neovim.nix
          ./shell.nix
          ./cli.nix
          ./user.nix
          ./windows.nix
          ./network.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userName} = import ./home.nix;
          }
        ];
      };
    };
  };
}
