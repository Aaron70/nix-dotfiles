{
  description = "Nix dotfiles configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: 
  let 
    sysLib = import ./libs/syslib.nix inputs;
  in
  {

    nixosConfigurations = {
      laptop-aaronv = sysLib.mkNixosFor "laptop";
    };

  };
}
