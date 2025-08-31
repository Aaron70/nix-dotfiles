{ lib, config, ... }: 

with lib;
let 
  cfg = config.features.nixos.gaming;
in
{
  options.features.nixos.gaming = {
    enable = mkEnableOption "Whether to enable common programs, services or configurations related to Gaming on NixOS.";
  };


  config = mkIf cfg.enable {
    services.nixos.opengl.enable = true;
    programs.nixos.steam.enable = true;
    programs.nixos.discord.enable = true;
  };
}
