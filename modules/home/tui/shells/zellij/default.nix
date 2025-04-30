{ ... }:

{ 
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl".text = builtins.readFile ./config.kdl;
}
