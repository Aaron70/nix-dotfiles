{
  description = "Nix dotfiles configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
 
    nvim.url = "github:aaron70/nvim";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";
  };

  outputs = { ... }@inputs: 
  let 
    extraNixosModules = [];
    extraHomeModules = [
      inputs.nvim.homeModule
      inputs.zen-browser.homeModules.beta
    ];
    syslib = import ./libs/syslib.nix ({ inherit extraNixosModules extraHomeModules; } // inputs) ;
  in
  {
    # ====================|NixOS Configurations|====================
    nixosConfigurations = {
      aaronv = syslib.mkNixosFor "aaronv" "pc" "personal";
      laptop-aaronv = syslib.mkNixosFor "laptop-aaronv" "laptop-msi" "personal";
    };
    # ====================|NixOS Configurations|====================

    # ================|Home Manager Configurations|=================
    homeConfigurations = {
    };
    # ================|Home Manager Configurations|=================

    # ====================|Darwin Configurations|===================
    darwinConfigurations = {
    };
    # ====================|Darwin Configurations|===================
  };
}
