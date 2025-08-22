{ config, pkgs, ... }:

let
  profile = config.profile;
in
{
  config = {
    home.username = profile.user.username;
    home.homeDirectory = "/home/${profile.user.username}";

    home.sessionVariables = {
      EDITOR = config.profile.editor.name;
      SHELL = config.profile.shell.name;
    };

    home.packages = with pkgs; [
      spotify
      bat
      #Fonts 
      nerd-fonts.jetbrains-mono
      openmoji-color
    ];

    home.shellAliases = {
      cat = "bat";
    };

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowBroken = true;

    programs.home-manager.enable = true;
    home.stateVersion = profile.version;
  };
}
