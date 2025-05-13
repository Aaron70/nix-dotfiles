{ lib, config, values, ... }:

let
  cfg = config.source-persisted-configs;
in
  with lib;
{
  options.source-persisted-configs = {
    enable = mkEnableOption "Weather to enable the activation script to persist some configurations";
  };

  config = mkIf cfg.enable {
    system.activationScripts.sourcePersistedConfigs = {
      text = ''
        HOME_PATH="/home/${values.users.default.username}"
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
