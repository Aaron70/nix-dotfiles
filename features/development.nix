{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.profile.shell.name = mkDefault "zsh";
    dotfiles.profile.terminal.name = mkDefault "ghostty";
    dotfiles.profile.editor.name = mkDefault "nvim";
    dotfiles.profile.browser.name = mkDefault "zen";

    dotfiles.modules.git.enable = mkDefault true;
    dotfiles.modules.tmux.enable = mkDefault true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig;
in
{ imports = [(mkModule { path = [ "features" ]; name = "development"; inherit nixosConfig homeConfig options; })]; }
