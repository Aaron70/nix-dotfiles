{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "go"; 
      options = {};
      commonConfig = {};
      nixosConfig = {}; 
      homeConfig = {
        programs.go.enable = true;

        home.packages = [
          pkgs.goperf
        ];

        home.sessionVariables = {
          PATH = "~/go/bin:$PATH";
          CGO_ENABLED = 1;
        };
      };
    })
  ];
}
