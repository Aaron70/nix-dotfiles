{ mylib, lib, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "discord"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        programs.discord.enable = true;
      };
    })
  ];
}
