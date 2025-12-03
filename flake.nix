{
  description = "Nix dotfiles configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
 
    nvim.url = "github:aaron70/nvim";
  };

  outputs = { ... }@inputs: 
  let 
    extraNixosModules = [];
    extraHomeModules = [
      inputs.nvim.homeModule
    ];
    syslib = import ./libs/syslib.nix ({ inherit extraNixosModules extraHomeModules; } // inputs) ;
  in
  {
    # ====================|NixOS Configurations|====================
    nixosConfigurations = {
      aaronv = syslib.mkNixosFor "pc" "personal";
      laptop-aaronv = syslib.mkNixosFor "laptop-msi" "personal";
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
