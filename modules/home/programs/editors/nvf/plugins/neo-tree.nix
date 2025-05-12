{ lib }:

{
  filetree.neo-tree = { 
    enable = true;

    setupOpts = {
      filesystem = {
        window = {
          position = "right";
          mappings = {
            "\\" = "close_window"; 
          };
        };
      };

      event_handlers = [
        {
          event = "file_opened";
          handler = lib.generators.mkLuaInline ''function(arg)
            require "neo-tree.command".execute({
              action = "close"
            })
          end'';
        }
      ];
    };
  };
}
