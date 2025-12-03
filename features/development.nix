{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  homeConfig = { ... }: {
    dotfiles.modules.zsh.enable = true;
    dotfiles.modules.ghostty.enable = true;
    dotfiles.modules.neovim.enable = true;
    dotfiles.modules.git.enable = true;
    dotfiles.modules.tmux.enable = true;

    dotfiles.modules.zen.enable = true;
  };
  nixosConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "features" ]; name = "development"; inherit nixosConfig homeConfig options; })]; }
