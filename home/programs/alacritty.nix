{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        indexed_colors = [
          {
            color = "#FE640B";
            index = 16;
          }
          {
            color = "#DC8A78";
            index = 17;
          }
        ];

        bright = {
          black = "#6C6F85";
          blue = "#1E66F5";
          cyan = "#179299";
          green = "#40A02B";
          magenta = "#EA76CB";
          red = "#D20F39";
          white = "#BCC0CC";
          yellow = "#DF8E1D";
        };

        cursor = {
          cursor = "#DC8A78";
          text = "#EFF1F5";
        };

        dim = {
          black = "#5C5F77";
          blue = "#1E66F5";
          cyan = "#179299";
          green = "#40A02B";
          magenta = "#EA76CB";
          red = "#D20F39";
          white = "#ACB0BE";
          yellow = "#DF8E1D";
        };

        hints = {
          end = {
            background = "#6C6F85";
            foreground = "#EFF1F5";
          };
          start = {
            background = "#DF8E1D";
            foreground = "#EFF1F5";
          };
        };

        normal = {
          black = "#5C5F77";
          blue = "#1E66F5";
          cyan = "#179299";
          green = "#40A02B";
          magenta = "#EA76CB";
          red = "#D20F39";
          white = "#ACB0BE";
          yellow = "#DF8E1D";
        };

        primary = {
          background = "#f3f5f6";
          bright_foreground = "#4C4F69";
          dim_foreground = "#4C4F69";
          foreground = "#1b2258";
        };

        search = {
          focused_match = {
            background = "#40A02B";
            foreground = "#EFF1F5";
          };
          matches = {
            background = "#6C6F85";
            foreground = "#EFF1F5";
          };
        };

        selection = {
          background = "#DC8A78";
          text = "#EFF1F5";
        };

        vi_mode_cursor = {
          cursor = "#7287FD";
          text = "#EFF1F5";
        };
      };

      font = {
        size = 11.0;
        bold = {
          family = "Fira Code";
          style = "Bold";
        };
        normal = {
          family = "Fira Code";
          style = "Regular";
        };
      };

      keyboard.bindings = [
        {
          action = "Paste";
          key = "V";
          mods = "Control|Shift";
        }
        {
          action = "Copy";
          key = "C";
          mods = "Control|Shift";
        }
        {
          action = "PasteSelection";
          key = "Insert";
          mods = "Shift";
        }
        {
          action = "Paste";
          key = "Paste";
        }
        {
          action = "Copy";
          key = "Copy";
        }
        {
          action = "ScrollPageUp";
          key = "PageUp";
          mode = "~Alt";
          mods = "Shift";
        }
        {
          action = "ScrollPageDown";
          key = "PageDown";
          mode = "~Alt";
          mods = "Shift";
        }
        {
          action = "ScrollToTop";
          key = "Home";
          mode = "~Alt";
          mods = "Shift";
        }
        {
          action = "ScrollToBottom";
          key = "End";
          mode = "~Alt";
          mods = "Shift";
        }
      ];

      scrolling.history = 1000;

      terminal.shell = {
        program = "/bin/zsh";
        args = ["-l" "-c" "tmux attach -2 || tmux -2"];
      };

      window = {
        decorations = "full";
        title = "Alacritty (zsh)";
        dimensions = {
          columns = 120;
          lines = 40;
        };
        padding = {
          x = 8;
          y = 8;
        };
      };
    };
  };
}
