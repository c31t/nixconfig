{
  description = "celt's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    minegrub-theme = {
      url = "github:Lxtharia/minegrub-world-sel-theme";
    };

    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follow = "nixpkgs";
    };

    lsfg-vk-flake.url = "github:pabloaul/lsfg-vk-flake/main";
    lsfg-vk-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    nixos-hardware,
    home-manager,
    plasma-manager,
    nix-flatpak,
    lsfg-vk-flake,
    solaar,
    ...
  } @ inputs: let
    username = "celt";
    system = "x86_64-linux";
    lib = nixpkgs.lib // home-manager.lib;
    commonArgs = {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs = import nixpkgs commonArgs;
    pkgs-stable = import nixpkgs-stable commonArgs;
  in {
    inherit lib commonArgs;

    nixosConfigurations = {
      steamhappy = lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {};

        modules = [
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-pc-ssd

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit pkgs-stable;
            };
            # plasma-manager kinda sucks unless you know what youre doing
            # home-manager.sharedModules = [inputs.plasma-manager.homeManagerModules.plasma-manager];
            home-manager.users."${username}".imports = [
              nix-flatpak.homeManagerModules.nix-flatpak
              ./home/celt.nix
            ];
          }
          inputs.minegrub-theme.nixosModules.default
          lsfg-vk-flake.nixosModules.default

          solaar.nixosModules.default

          ./configuration.nix
          ./pkgs
          ./machines/steamhappy
          ./users/celt.nix
        ];
      };
    };
  };
}
