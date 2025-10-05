{ lib, config, pkgs, ... }:

with lib;
let 
  cfg = config.programs.nixos.godot;
in
{
  options.programs.nixos.godot = {
    enable = mkEnableOption "Whether to enable the Godot";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      godot
    ];
  };
}
