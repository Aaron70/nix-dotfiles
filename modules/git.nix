{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "git"; 
      options = {
        integrations = mkBoolOption "Whether to enable git integrations. Like gh and lazygit." true;
        userName = mkOption {
          type = types.str;
          default = config.dotfiles.profile.user.username;
          description = "The username of the git user. Name that will be shown on commits.";
        };
        userEmail = mkOption {
          type = types.str;
          default = config.dotfiles.profile.user.email;
          description = "The username of the git user. Name that will be shown on commits.";
        };
      };
      commonConfig = {};
      nixosConfig = {};
      homeConfig = { cfg, ... }: { 
        home.shellAliases = {
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
            settings.user = {
              name = cfg.userName;
              email = cfg.userEmail;
            };
          };
        };
      };
    })
  ];
}
