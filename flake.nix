{
  description = "Nix dotfiles configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
    let 
      utils = import ./utils { inherit inputs; };
    in {  
      # ====================|NixOS Configurations|====================
      nixosConfigurations = {
        aaronv = nixpkgs.lib.nixosSystem {
          modules = [
            inputs.home-manager.nixosModules.home-manager

            ./hosts/aaronv/configuration.nix

            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                extraSpecialArgs = {
                  inherit inputs;
                  outputs = inputs.self.outputs;
                };
                users = {
                  aaronv = {...}: {
                    imports = [
                      ./hosts/aaronv/home.nix
                    ];
                  };
                };
              };
            }
          ];
        };
      };
      # ====================|NixOS Configurations|====================


      # ====================|Home Manager Configurations|====================
      homeManagerConfigurations = home-manager.lib.homeManagerConfiguration {
        aaronv = {
          modules = [ 
            ./hosts/aaronv/home.nix
          ];
        };
      };
      # ====================|Home Manager Configurations|====================
    };
}
