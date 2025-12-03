{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  colors = if (config.lib ? stylix) then config.lib.stylix.colors else {
    base0A = "FFFFFF";
    base0F = "FFFFFF";
    base0E = "FFFFFF";
  };
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }:  {
    programs.oh-my-posh = {
      enable = true;

      settings = with builtins; fromJSON (unsafeDiscardStringContext (import ./config.nix { inherit colors; }));

      enableBashIntegration = config.programs.bash.enable;
      enableZshIntegration = config.programs.zsh.enable;
      enableNushellIntegration = config.programs.nushell.enable;
    };
  };
in
{ imports = [(mkModule { enable = true; path = [ "modules" ]; name = "oh-my-posh"; inherit nixosConfig homeConfig options; })]; }
