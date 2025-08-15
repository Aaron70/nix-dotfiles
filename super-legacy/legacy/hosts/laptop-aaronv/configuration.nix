{ pkgs, lib, ... }:
with lib; {
  imports = [ 
    ./hardware-configuration.nix
    ../bluetooth.nix
    ../boot.nix
  ];

  services.displayManager.sddm.enable = mkForce false;
  services.xserver.displayManager.gdm.enable = mkForce true;



  environment.systemPackages = with pkgs; [
      upower
   ];
}
