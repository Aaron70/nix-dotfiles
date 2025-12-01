{ lib, config, pkgs, ... }:

with lib;
let 
  cfg = config.programs.home.terraform;
in
{
  options.programs.home.terraform = {
    enable = mkEnableOption "Whether to enable the Terraform CLI.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      terraform
    ];
  };
}
