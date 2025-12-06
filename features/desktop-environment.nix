{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.modules.gdm.enable = true;
    dotfiles.modules.niri.enable = true;
    dotfiles.modules.noctalia.enable = true;
    dotfiles.modules.xdg-portal.enable = true;
    dotfiles.modules.thermald.enable = true;
    dotfiles.modules.cursor-theme.enable = true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig // {
    security.polkit.enable = true;
    security.pam.services.swaylock = {};
    services.gnome.gnome-keyring.enable = true; # secret service

    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
in
{ imports = [(mkModule { path = [ "features" ]; name = "desktop-environment"; inherit nixosConfig homeConfig options; })]; }
