{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.nixos.discord; 
in
{
  options.programs.nixos.discord = {
    enable = mkEnableOption "Whether to enable Discord.";
  };

  config = mkIf (config.profile.withGUI && cfg.enable) {
    # This will install Discord PTB for all users of the system
    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}
