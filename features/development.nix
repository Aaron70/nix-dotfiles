{ lib, ... }:

with lib;
{
  options.features.development = {
    enable = mkEnableOption "Whether to enable common development programs, scripts and services";
  };

  config = mkIf config.features.development.enable && config.profile.enable {
    import = [
      ../modules/programs/git.nix
    ];

    git.enable = true;
    git.integrations = true;
    git.userName = config.profile.username;
    git.userEmail = config.profile.email;
  };
}
