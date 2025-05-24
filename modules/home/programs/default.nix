{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  homePrograms = {
    git.enable = true;
    git.integrations = true;

    shells.nushell.enable = true;
    shells.zoxide.enable = true;
    shells.zellij.enable = true;

    terminals.alacritty.enable = true;

    editors.neovim.nvf.enable = true;

    windowManagers.hyprland.enable = true;
    windowManagers.wofi.enable = true;
    windowManagers.waybar.enable = true;

    browsers.firefox.enable = true;
    browsers.zen.enable = true;
  };
}
