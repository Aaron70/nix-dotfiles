{ mylib, lib, ... }: 
with mylib; with lib;
let
in
{ 
  imports = [
    (mkModule {
      path = [ "features" ]; 
      name = "development"; 
      options = {};
      commonConfig = {
        dotfiles.features.terminal-environment.enable = mkDefault true;

        dotfiles.modules.gcp.enable = mkDefault true;
        dotfiles.modules.go.enable = mkDefault true;
        dotfiles.modules.java.enable = mkDefault true;
        dotfiles.modules.javascript.enable = mkDefault true;
        dotfiles.modules.terraform.enable = mkDefault true;
      };
      homeConfig = {};
      nixosConfig = {};
    })
  ]; 
}
