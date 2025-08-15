{ ... }:

{
  imports = [ ./properties.nix ];


  # ====================|Boot|====================
  features.nixos.boot.enable = true;
  features.nixos.boot.configurationLimit = 7;
  # ====================|Boot|====================
}
