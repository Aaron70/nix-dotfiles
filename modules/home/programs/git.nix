{ lib, config, values,... }:

let
  cfg = config.homePrograms.git;
in
  with lib;
{
  options.homePrograms.git = {
    enable = mkEnableOption "Weather to enable git";
    integrations = mkEnableOption "Weather to enable git integrations. Like gh and lazygit.";
    userName = mkOption {
      type = types.str;
      default = values.users.default.username;
      description = "The username of the git user. Name that will be shown on commits.";
    };
    userEmail = mkOption {
      type = types.str;
      default = values.users.default.email;
      description = "The username of the git user. Name that will be shown on commits.";
    };
  };
                                                                                                
  config.programs = mkIf cfg.enable {
    gh.enable = cfg.integrations;
    lazygit.enable = cfg.integrations;
    git = {
      enable = cfg.enable;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
    };
  };
}
