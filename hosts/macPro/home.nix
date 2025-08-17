{ lib, config, ... }:

with lib;
let 
  profile = config.profile;
in
{
  imports = [ ../home.nix ];

  home.homeDirectory = mkForce /Users/${profile.user.username};
}
