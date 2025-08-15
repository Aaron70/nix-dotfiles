{ config, ... }:

let
  profile = config.profile;
in
{
  config = {
    home.username = profile.user.username;
    home.homeDirectory = "/home/${profile.user.username}";

    programs.home-manager.enable = true;
    home.stateVersion = profile.version;
  };
}
