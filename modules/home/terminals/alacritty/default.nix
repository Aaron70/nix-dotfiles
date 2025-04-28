{ values, pkgs, config, ... }:

with values.terminals;
{
  programs.alacritty = {
    enable = alacritty.enable;
    package = config.lib.nixGL.wrap pkgs.alacritty;


    settings = {

      general = {
        import = [
          ./themes/tokyo-night.toml
        ];
    
        live_config_reload = true;
      };
          
      bell = {
        animation = "EaseOutExpo";
        duration = 0;
      };
    
      colors = {
        draw_bold_text_with_bright_colors = true;
      };
    
      cursor = {
        blink_interval = 500;
        blink_timeout = 5;
        unfocused_hollow = false;
        style = {
          blinking = "Off";
          shape = "Underline";
        };
      };
    
      env = {
        TERM = "xterm-256color";
      };
    
      font = {
        size = 13;
    
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
    
        glyph_offset = {
          x = 0;
          y = 0;
        };
    
        italic = {
          family = "JetBrainsMono Nerd Font";
        };
    
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
    
        offset = {
          x = 0;
          y = 0;
        };
      };
    
      mouse = {
        hide_when_typing = true;
        bindings = [
          {
            action = "PasteSelection";
            mouse = "Middle";
          }
        ];
      };
    
      hints = {
        enabled = [
          {
            command = "firefox";
            hyperlinks = true;
            post_processing = true;
            persist = false;
            mouse = {
              enabled = true;
            };
            binding = {
              key = "U";
              mods = "Control|Shift";
            };
            # regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\u0000-\u001F\u007F-\u009F<>\"\\\s{-}\\^⟨⟩`]+";
          }
        ];
      };
    
      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>";
      };
    
      terminal = {
        shell = {
          program = values.shells.default;
        };
      };
    
      window = {
        decorations = "None";
        dynamic_title = true;
        option_as_alt = "Both";
        startup_mode = "Maximized";
    
        dimensions = {
          columns = 160;
          lines = 80;
        };
    
        padding = {
          x = 4;
          y = 4;
        };
      };
    };
  };
}
