{ ... }:

{
  imports = [ ./profile.nix ];


  profile.enable = true;
  profile.user.email = "aarongeovanny70@gmail.com";

  # ====================|Features|====================

  # ====================|Boot|====================
  features.nixos.boot.enable = true;
  features.nixos.boot.configurationLimit = 7;
  # ====================|Boot|====================

  # ====================|Features|====================
}
