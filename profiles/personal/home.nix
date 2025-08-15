{ ... }:

{
  imports = [ ./properties.nix ];

  programs.home.git.enable = true;
  programs.home.git.integrations = true;
}
