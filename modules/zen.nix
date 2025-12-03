{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }: {
    programs.zen-browser = {
      enable = true;
      policies = {
        DisableAppUpdate = false;
        DisableTelemetry = true;
      };
    };
  };
in
{ imports = [(mkModule { enable = config.dotfiles.profile.browser.name == "zen"; path = [ "modules" ]; name = "zen"; inherit nixosConfig homeConfig options; })]; }
