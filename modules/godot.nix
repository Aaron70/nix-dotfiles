{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "godot"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        environment.systemPackages = with pkgs; [
          godot
        ];
      };
      homeConfig = {};
    })
  ];
}
