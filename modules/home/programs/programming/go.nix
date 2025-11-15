{ lib, config, pkgs, ... }:

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

    home.packages = [
      pkgs.goperf
    ];

    home.sessionVariables = {
      PATH = "~/go/bin:$PATH";
      CGO_ENABLED = 1;
    };
  };
}
