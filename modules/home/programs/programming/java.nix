{ lib, config, ... }:

with lib;
let 
  cfg = config.programs.home.java;
in
{
  options.programs.home.java = {
    enable = mkEnableOption "Whether to enable the Java programming language.";
  };

  config = mkIf cfg.enable {
    programs.java.enable = true;
    programs.gradle.enable = true;
  };
}
