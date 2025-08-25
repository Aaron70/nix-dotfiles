{ lib, config, ... }:

let
  cfg = config.services.nixos.opengl;
in
  with lib;
{
  options.services.nixos.opengl = {
    enable = mkEnableOption "Whether to enable OpenGL";
  };

  config = mkIf cfg.enable {
    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
    };
  };
}
