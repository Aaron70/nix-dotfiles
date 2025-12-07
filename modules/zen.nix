{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = config.dotfiles.profile.browser.name == "zen";  
      path = [ "modules" ]; 
      name = "zen"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        programs.zen-browser = {
          enable = true;
          policies = {
            DisableAppUpdate = false;
            DisableTelemetry = true;
          };
        };
      };
    })
  ];
}
