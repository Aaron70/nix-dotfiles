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
      myLib = import ./libs/sysLib.nix { inherit inputs; };
    in {  
      # ====================|NixOS Configurations|====================
      nixosConfigurations = {
        aaronv = myLib.mkSystemFor "aaronv";
      };
      # ====================|NixOS Configurations|====================


      # ====================|Home Manager Configurations|====================
      homeManagerConfigurations = {
        aaronv = myLib.mkHomeFor "aaronv";
      };
      # ====================|Home Manager Configurations|====================
    };
}
