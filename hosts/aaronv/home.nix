{ pkgs, ... }:

let
  values = import ./values.nix;
  user = values.users.default;
in {

  imports = [ 
    ../../modules/home/programs 
  ];

  home.username = user.username;
  home.homeDirectory = "/home/${user.username}";

  home.packages = with pkgs; [
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
    EDITOR = "neovim";
  };

  home.shellAliases = {
    cat = "bat";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
