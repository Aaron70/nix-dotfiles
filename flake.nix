{
  description = "Nix dotfiles configurations";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:nix-community/nixGL";

    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nvf, nixgl, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixgl.overlay ];
      };
    in {
      nixosConfigurations = {
        aaronv = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };


      homeConfigurations = {
        aaronv = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example, the path to your home.nix.
          modules = [ 
            nvf.homeManagerModules.default
            ./configurations/home/aaronv
          ];

          # Optionally use extraSpecialArgs to pass through arguments to home.nix
          extraSpecialArgs = {
            inherit nixgl;
            values = import ./configurations/home/aaronv/values.nix;
          };
        };
      };
    };
}
