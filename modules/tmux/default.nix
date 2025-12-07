{ mylib, lib, config, pkgs, ... }: 
with mylib; with lib;
let
  colors = if (config.lib ? stylix) then config.lib.stylix.colors else { base00 = "FFFFFF"; };
in
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "tmux"; 
      options = {
        extraSearchPaths = mkOption {
          description = "The list of paths to add to the tmux-sessionizer script";
          type = types.str;
          default = "";
        };
        prefix = mkOption {
          description = "The prefix used for the tmux configuration";
          type = types.str;
          default = "C-space";
        };
      };
      commonConfig = {};
      nixosConfig = {};
      homeConfig = { cfg, ... }@inputs: {
        xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = import ./tmux-sessionizer.nix { inherit config; };
        home.packages = [
          (pkgs.writeShellScriptBin "tmux-sessionizer" (lib.readFile ./scripts/tmux-sessionizer.sh))
          (pkgs.writeShellScriptBin "start-session" (lib.readFile ./scripts/start-session.sh))
        ];

        programs.tmux = {
          enable = true;
          mouse = true;
          baseIndex = 1;
          shell = config.dotfiles.profile.shell.path; 
          keyMode = "vi";
          prefix = cfg.prefix;
          plugins = [
            # pkgs.tmuxPlugins.tmux-floax
            pkgs.tmuxPlugins.sensible
            pkgs.tmuxPlugins.resurrect
          ];
          extraConfig = import ./config.nix (inputs // { inherit colors; }) ;
        };
      };
    })
  ];
}
