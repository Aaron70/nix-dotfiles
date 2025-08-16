{ lib, config, ... }:

with lib;
let 
  cfg = config.programs.home.go;
in
{
  options.programs.home.go = {
    enable = mkEnableOption "Whether to enable the Go programming language.";
  };

  config = mkIf cfg.enable {
    programs.go.enable = true;
  };
}
