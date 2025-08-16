{ ... }:

{
  imports = [ ./properties.nix ];

  features.home.development.enable = true;

  programs.home.zen.enable = true;
}
