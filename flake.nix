{
  description = "Nix dotfiles configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.hyprlang.follows = "hyprland/hyprlang";
    };

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
        vm-aaronv = myLib.mkSystemFor "vm-aaronv";
      };
      # ====================|NixOS Configurations|====================


      # ====================|Home Manager Configurations|====================
      homeConfigurations = {
        aaronv = myLib.mkHomeFor "aaronv" "x86_64-linux";
        vm-aaronv = myLib.mkHomeFor "vm-aaronv" "x86_64-linux";
      };
      # ====================|Home Manager Configurations|====================
    };
}
