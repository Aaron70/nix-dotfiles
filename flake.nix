{
  description = "Nix dotfiles configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { ... }@inputs: 
  let 
    extraNixosModules = [];
    extraHomeModules = [];
    mylib = import ./lib/mylib.nix inputs // { inherit extraNixosModules extraHomeModules; } ;
  in
  {
    # ====================|NixOS Configurations|====================
    nixosConfigurations = {
      laptop-aaronv = mylib.mkNixosFor "laptop-msi";
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
