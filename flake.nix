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
      nixosConfigurations = {
        aaronv = utils.mkSystem ./aaronv;
      };
    };
}
