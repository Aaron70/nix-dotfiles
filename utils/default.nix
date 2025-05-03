{ inputs }:

{
  mkSystem = hostConfig: 
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { };
      modules = [ hostConfig ];
    };
}
