{ config, ... }:

let
  profile = config.profile;
in
{
  imports = [ 
    ./properties.nix
    ../../modules/nixos/services/stylix.nix
  ];

  services.nixos.stylix.enable = profile.variables.stylix;
}
