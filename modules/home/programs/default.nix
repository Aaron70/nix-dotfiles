{  ... }:

{
  imports = [
    ./git.nix
  ]; 

  homePrograms = {
    git = {
      enable = true;
      integrations = true;
    };
  };
}
