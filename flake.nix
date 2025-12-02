{
  description = "Nix dotfiles configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:NotAShelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    nvim.url = "github:aaron70/nvim";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # zen-browser.inputs.nixpkgs.follows = "nixpkgs"; # BUG: Check why adding this generates problems 

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    rose-pine-hyprcursor.inputs.nixpkgs.follows = "nixpkgs";
    # rose-pine-hyprcursor.inputs.hyprlang.follows = "hyprland/hyprlang"; # BUG: wrong flake, looks like it doesn't exists

    astal.url = "github:aylur/astal";
    ags.url = "github:aylur/ags";

    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = { self, ... }@inputs: 
  let 
    sysLib = import ./libs/syslib.nix inputs;
  in
  {
    # ====================|NixOS Configurations|====================
    nixosConfigurations = {
      aaronv = sysLib.mkNixosFor "personal" "pc";
      laptop-aaronv = sysLib.mkNixosFor "personal" "laptop";
      wsl-aaronv = sysLib.mkNixosFor "personal" "wsl";
    };
    # ====================|NixOS Configurations|====================

    # ================|Home Manager Configurations|=================
    homeConfigurations = {
      aaronv = sysLib.mkHomeFor "personal" "wsl" "x86_64-linux";
    };
    # ================|Home Manager Configurations|=================

    # ====================|Darwin Configurations|===================
    darwinConfigurations = {
      aaronv-work = sysLib.mkDarwinFor "work" "macPro" "aarch64-darwin";
    };
    # ====================|Darwin Configurations|===================
  };
}
