{ mylib, lib, ... }@inputs: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];
      name = "noctalia";
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        programs.noctalia-shell = {
          enable = true;
          systemd.enable = true;
          settings = import ./config.nix inputs;
        };
      };
    })
  ];
}
