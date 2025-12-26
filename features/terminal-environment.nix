{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "features" ]; 
      name = "terminal-environment"; 
      options = {};
      commonConfig = {
        dotfiles.profile.shell.name = mkDefault "zsh";
        dotfiles.profile.shell.path = mkDefault "${pkgs.zsh}/bin/zsh";
        dotfiles.profile.terminal.name = mkDefault "ghostty";
        dotfiles.profile.editor.name = mkDefault "nvim";
        dotfiles.profile.browser.name = mkDefault "zen";

        dotfiles.modules.git.enable = mkDefault true;
        dotfiles.modules.tmux.enable = mkDefault true;
        dotfiles.modules.zellij.enable = mkDefault true;
      };
      homeConfig = {};
      nixosConfig = {};
    })
  ];
}
