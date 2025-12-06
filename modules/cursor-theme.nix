{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }: {
    home.packages = with pkgs; [ rose-pine-cursor ];
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 25;
    };
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "cursor-theme"; inherit nixosConfig homeConfig options; })]; }
