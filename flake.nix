{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
        system = "x86_64-linux";
        modules = [
          (import ./configuration.nix {isInWsl = true;})
          (import ./neovim.nix {
            userName = userName;
            pkgsUnstable = pkgsUnstable;
            system = system;
          })
          (import ./shell.nix {
            userName = userName;
          })
          (import ./cli.nix {userName = userName;})
          (import ./user.nix {userName = userName;})
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.11";
            wsl.enable = true;
            wsl.defaultUser = userName;
            wsl.useWindowsDriver = true;
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
        system = "x86_64-linux";
        modules = [
          (import ./inputMethod.nix {userName = userName;})
          (import ./configuration.nix {isInWsl = false;})
          (import ./neovim.nix {
            userName = userName;
            pkgsUnstable = pkgsUnstable;
            system = system;
          })
          (import ./shell.nix {
            userName = userName;
          })
          (import ./cli.nix {userName = userName;})
          (import ./user.nix {userName = userName;})
          (import ./windows.nix {
            userName = userName;
            pkgsUnstable = pkgsUnstable;
          })
          (import ./proxy.nix {userName = userName;})
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
