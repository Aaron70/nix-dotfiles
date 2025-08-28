{ lib, config, pkgs, ... }:

with lib;
let 
  cfg = config.programs.home.javascript;
in
{
  options.programs.home.javascript = {
    enable = mkEnableOption "Whether to enable the Javascript programming language.";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [ nodejs ];

    programs.bun.enable = true;
  };
}
