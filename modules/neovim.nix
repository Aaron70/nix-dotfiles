{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }: {
    nvim = {
      enable = true;
      packageNames = [ "nvim" ];
    };
  };
in
{ imports = [(mkModule { enable = config.dotfiles.profile.editor.name == "nvim"; path = [ "modules" ]; name = "neovim"; inherit nixosConfig homeConfig options; })]; }
