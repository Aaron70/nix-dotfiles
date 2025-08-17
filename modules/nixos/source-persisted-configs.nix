{ lib, config, ... }:

let
  cfg = config.source-persisted-configs;
in
  with lib;
{
  options.source-persisted-configs = {
    enable = mkEnableOption "Whether to enable the activation script to persist some configurations";
  };

  config = mkIf cfg.enable {
    system.activationScripts.sourcePersistedConfigs = {
      text = ''
        HOME_PATH="/home/${config.profile.user.username}"
        PERSIST_PATH="$HOME_PATH/.persist"

        if [ ! -d "$PERSIST_PATH" ]; then
          exit 0
        fi

        if [ ! -f "$HOME_PATH/.config/gh/hosts.yml" ]; then
          ln $PERSIST_PATH/gh/hosts.yml $HOME_PATH/.config/gh/hosts.yml
        fi
        '';
    };
  };
}
