{
  description = "Nix dotfiles configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:NotAShelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # zen-browser.inputs.nixpkgs.follows = "nixpkgs"; # BUG: Check why adding this generates problems 

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    rose-pine-hyprcursor.inputs.nixpkgs.follows = "nixpkgs";
    # rose-pine-hyprcursor.inputs.hyprlang.follows = "hyprland/hyprlang"; # BUG: wrong flake, looks like it doesn't exists
  };

  outputs = { ... }@inputs: 
  let 
    sysLib = import ./libs/syslib.nix inputs;
  in
  {

    nixosConfigurations = {
      laptop-aaronv = sysLib.mkNixosFor "personal" "laptop" "TODO: Change this for the actual system";
    };

  };
}
