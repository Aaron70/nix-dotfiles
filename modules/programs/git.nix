{ lib, config, ... }:

let
  cfg = config.homePrograms.git;
in
  with lib;
{
  options.homePrograms.git = {
    enable = mkEnableOption "Whether to enable git";

    integrations = mkEnableOption "Whether to enable git integrations. Like gh and lazygit.";

    userName = mkOption {
      type = types.str;
      description = "The username of the git user. Name that will be shown on commits.";
    };

    userEmail = mkOption {
      type = types.str;
      description = "The username of the git user. Name that will be shown on commits.";
    };
  };
                                                                                                
  config = mkIf cfg.enable { 
   home.shellAliases = {
     g = "git";
     lg = "lazygit";
   };

   programs = {
      gh = mkIf cfg.integrations {
        enable = true;
        gitCredentialHelper.enable = true;
      };
      lazygit.enable = cfg.integrations;
      git = {
        enable = cfg.enable;
        userName = cfg.userName;
        userEmail = cfg.userEmail;
      };
    };
  };
}
