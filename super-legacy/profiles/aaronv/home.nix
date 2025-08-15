{ host,pkgs, config, ... }:

let
  values = config.values;
  user = values.user;
in
{
  imports = [ ];

  config = {
    home.username = user.username;
    home.homeDirectory = "/home/${user.username}";

    home.packages = with pkgs; [
      bat
      file
      imgcat
      chafa
      cowsay
      ripgrep
      wl-clipboard
      #Fonts 
      nerd-fonts.jetbrains-mono
      openmoji-color
      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    home.file = { };

    home.sessionVariables = {
      EDITOR = config.values.editors.default.name;
      SHELL = config.values.shells.default.name;
    };

    home.shellAliases = {
      cat = "bat";
      nswitch = "sudo nixos-rebuild switch";
      ntest = "sudo nixos-rebuild test";
    };

    programs.home-manager.enable = true;
    home.stateVersion = values.version;
  };
}
