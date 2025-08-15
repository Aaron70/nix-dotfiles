{
  description = "Nix dotfiles configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
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
