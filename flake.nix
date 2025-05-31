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

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
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
        wsl-aaronv = myLib.mkSystemFor "wsl-aaronv";
      };
      # ====================|NixOS Configurations|====================


      # ====================|Home Manager Configurations|====================
      homeConfigurations = {
        aaronv = myLib.mkHomeFor "aaronv" "x86_64-linux";
        wsl-aaronv = myLib.mkHomeFor "wsl-aaronv" "x86_64-linux";
      };
      # ====================|Home Manager Configurations|====================
    };
}
