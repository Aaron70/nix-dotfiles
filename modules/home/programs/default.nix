{ ... }:

{
  imports = [
    ./git.nix
    ./shells
  ]; 

  homePrograms = {
    git = {
      enable = true;
      integrations = true;
    };
    shells = {
      nushell.enable = true;
    };
  };
}
