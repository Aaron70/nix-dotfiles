{
  description = "Nix dotfiles configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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

    zjstatus = {
      url = "github:dj95/zjstatus";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        laptop-aaronv = myLib.mkSystemFor "laptop-aaronv";
      };
      # ====================|NixOS Configurations|====================


      # ====================|Home Manager Configurations|====================
      homeConfigurations = {
        aaronv = myLib.mkHomeFor "aaronv" "x86_64-linux";
        laptop-aaronv = myLib.mkHomeFor "laptop-aaronv" "x86_64-linux";
      };
      # ====================|Home Manager Configurations|====================
    };
}
