{
  description = "Nix dotfiles configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
    let 
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ ];
      };
      myLib = import ./libs/sysLib.nix { inherit inputs pkgs; };
    in {  
      # ====================|NixOS Configurations|====================
      nixosConfigurations = {
        aaronv = myLib.mkSystemFor "aaronv";
      };
      # ====================|NixOS Configurations|====================


      # ====================|Home Manager Configurations|====================
      homeConfigurations = {
        aaronv = myLib.mkHomeFor "aaronv" "x86_64-linux";
      };
      # ====================|Home Manager Configurations|====================
    };
}
