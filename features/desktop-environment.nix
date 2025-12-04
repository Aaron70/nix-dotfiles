{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.modules.gdm.enable = true;
    dotfiles.modules.niri.enable = true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig // {
    environment.systemPackages = with pkgs; [
      mako # Notification daemon
      wl-clipboard
    ];
  };
in
{ imports = [(mkModule { path = [ "features" ]; name = "desktop-environment"; inherit nixosConfig homeConfig options; })]; }
