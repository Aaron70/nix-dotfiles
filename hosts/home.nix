{ config, pkgs, ... }:

let
  profile = config.profile;
in
{
  config = {
    home.username = profile.user.username;
    home.homeDirectory = "/home/${profile.user.username}";

    home.sessionVariables = {
      # EDITOR = config.profile.editor.name;
      SHELL = config.profile.shell.name;
    };

    home.packages = with pkgs; [
      bat
      wl-clipboard
      #Fonts 
      nerd-fonts.jetbrains-mono
      openmoji-color
    ];

    home.shellAliases = {
      cat = "bat";
      nswitch = "sudo nixos-rebuild switch";
      ntest = "sudo nixos-rebuild test";
    };

    programs.home-manager.enable = true;
    home.stateVersion = profile.version;
  };
}
