{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.sway;

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      startup = [
        { command = "alacritty"; }
      ];
    };
  };
}
