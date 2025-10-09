{ lib, config, pkgs, ... }:

let
  cfg = config.programs.home.spotify;
in
  with lib;
{
  options.programs.home.spotify = {
    enable = mkEnableOption "Whether to enable spotify";
  };
                                                                                                
  config = mkIf cfg.enable { 
   home.packages = with pkgs; [
      spotify
   ];
  };
}
