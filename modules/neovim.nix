{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = config.dotfiles.profile.editor.name == "nvim";  
      path = [ "modules" ]; 
      name = "neovim"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        nvim = {
          enable = true;
          packageNames = [ "nvim" ];
        };
      };
    })
  ];
}
