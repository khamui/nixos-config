{
  pkgs,
  nvf,
  ...
}: {
  imports = [nvf.homeManagerModules.default];

  programs.neovim.defaultEditor = true;
  # COMMAND: ln -s ~/reponame/home/programs/dotfiles/.config/nvf ~/.config/nvf
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;

      globals.mapleader = ";";

      options = {
        tabstop = 2;
        shiftwidth = 0;
        softtabstop = 2;
      };

      keymaps = [
        {
          key = "jk";
          mode = ["i"];
          action = "<ESC>";
          silent = true;
        }
        {
          key = "<leader> ";
          mode = ["n"];
          action = "<cmd>HopWord<CR>";
          silent = true;
        }
        {
          key = "H";
          mode = ["n" "v"];
          action = "0";
          silent = true;
        }
        {
          key = "L";
          mode = ["n" "v"];
          action = "$";
          silent = true;
        }
        {
          key = "vv";
          mode = ["n"];
          action = "0v$";
          silent = true;
        }
        {
          key = "<C-A>";
          mode = ["n"];
          action = "gg0vG$";
          silent = true;
        }
        {
          key = "v";
          mode = ["n"];
          action = "<C-v>";
          silent = true;
        }
        {
          key = "<leader>o";
          mode = ["n"];
          action = "o<ESC>";
          silent = true;
        }
        {
          key = "<leader>O";
          mode = ["n"];
          action = "O<ESC>";
          silent = true;
        }
        {
          key = "<M-l>";
          mode = ["n"];
          action = ":vsp<CR>";
          silent = true;
        }
        {
          key = "<M-j>";
          mode = ["n"];
          action = ":sp<CR>";
          silent = true;
        }
        {
          key = "<C-l>";
          mode = ["n"];
          action = "<C-w>l";
          silent = true;
        }
        {
          key = "<C-h>";
          mode = ["n"];
          action = "<C-w>h";
          silent = true;
        }
        {
          key = "<C-j>";
          mode = ["n"];
          action = "<C-w>j";
          silent = true;
        }
        {
          key = "<C-k>";
          mode = ["n"];
          action = "<C-w>k";
          silent = true;
        }
        #### NEO TREE ####
        {
          key = "<C-t>";
          mode = ["n"];
          action = "<Cmd>Neotree toggle<CR>";
          silent = true;
        }
        {
          key = "<leader><C-f>";
          mode = ["n"];
          action = "<Cmd>Neotree reveal<CR>";
          silent = true;
        }
        #### LSP SAGA ####
        {
          key = "gd";
          mode = ["n"];
          action = "<cmd>Lspsaga goto_definition<CR>";
          silent = true;
        }
        {
          key = "<leader>ca";
          mode = ["n"];
          action = "<cmd>Lspsaga code_action<CR>";
          silent = true;
        }
        {
          key = "gt";
          mode = ["n"];
          action = "<cmd>Lspsaga peek_type_definition<CR>";
          silent = true;
        }
        {
          key = "gl";
          mode = ["n"];
          action = "<cmd>Lspsaga show_line_diagnostics<CR>";
          silent = true;
        }
        ###### TELESCOPE ######
        {
          key = "gr";
          mode = ["n"];
          action = "require('telescope.builtin').lsp_references()";
          silent = true;
        }
        ###### SPLIT RESIZES ######
        {
          key = "-";
          mode = ["n"];
          action = "<cmd>vertical resize -5<CR>";
          silent = true;
        }
        {
          key = "+";
          mode = ["n"];
          action = "<cmd>vertical resize +5<CR>";
          silent = true;
        }
      ];

      debugMode = {
        enable = false;
        level = 16;
        logFile = "/tmp/nvim.log";
      };

      spellcheck = {
        enable = false;
        programmingWordlist.enable = false;
      };

      lsp = {
        # This must be enabled for the language modules to hook into
        # the LSP API.
        enable = true;

        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = false;
        lspsaga.enable = true;
        trouble.enable = false;
        lspSignature.enable = false; # conflicts with blink in maximal
        otter-nvim.enable = false;
        nvim-docs-view.enable = false;
      };

      debugger = {
        nvim-dap = {
          enable = false;
          ui.enable = false;
        };
      };

      # This section does not include a comprehensive list of available language modules.
      # To list all available language module options, please visit the nvf manual.
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        # Languages that will be supported in default and maximal configurations.
        nix.enable = true;
        markdown.enable = true;

        # Languages that are enabled in the maximal configuration.
        bash.enable = true;
        css.enable = true;
        html.enable = true;
        sql.enable = false;
        java.enable = false;
        kotlin.enable = false;
        ts.enable = true;
        go.enable = false;
        lua.enable = true;
        zig.enable = false;
        python.enable = false;
        typst.enable = false;
        rust = {
          enable = false;
          crates.enable = false;
        };

        # Language modules that are not as common.
        assembly.enable = false;
        astro.enable = false;
        nu.enable = false;
        csharp.enable = false;
        julia.enable = false;
        vala.enable = false;
        scala.enable = false;
        r.enable = false;
        gleam.enable = false;
        dart.enable = false;
        ocaml.enable = false;
        elixir.enable = false;
        haskell.enable = false;
        ruby.enable = false;
        fsharp.enable = false;

        tailwind.enable = true;
        svelte.enable = false;

        # Nim LSP is broken on Darwin and therefore
        # should be disabled by default. Users may still enable
        # `vim.languages.vim` to enable it, this does not restrict
        # that.
        # See: <https://github.com/PMunch/nimlsp/issues/178#issue-2128106096>
        nim.enable = false;
      };

      visuals = {
        nvim-scrollbar.enable = false;
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = false;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;

        # Fun
        cellular-automaton.enable = false;
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "tokyonight";
        };
      };

      theme = {
        enable = true;
        name = "tokyonight";
        transparent = false;
        style = "night";
        extraConfig = ''
          vim.o.background = "dark"
        '';
      };

      autopairs.nvim-autopairs.enable = true;

      # nvf provides various autocomplete options. The tried and tested nvim-cmp
      # is enabled in default package, because it does not trigger a build. We
      # enable blink-cmp in maximal because it needs to build its rust fuzzy
      # matcher library.
      autocomplete = {
        nvim-cmp.enable = true;
        blink-cmp.enable = false;
      };

      snippets.luasnip.enable = true;

      filetree = {
        neo-tree = {
          enable = true;
        };
      };

      tabline = {
        nvimBufferline.enable = false;
      };

      treesitter.context.enable = false;

      binds = {
        whichKey.enable = false;
        cheatsheet.enable = false;
      };

      telescope.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
        neogit.enable = true;
      };

      minimap = {
        minimap-vim.enable = false;
        codewindow.enable = false; # lighter, faster, and uses lua for configuration
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
      };

      projects = {
        project-nvim.enable = false;
      };

      utility = {
        ccc.enable = false;
        vim-wakatime.enable = false;
        diffview-nvim.enable = true;
        yanky-nvim.enable = false;
        icon-picker.enable = false;
        surround.enable = true;
        leetcode-nvim.enable = false;
        multicursors.enable = true;
        smart-splits.enable = true;
        undotree.enable = false;
        # hint at closing bracket
        #nvim-biscuits.enable = true;

        motion = {
          hop.enable = true;
          leap.enable = false;
          precognition.enable = false;
        };
        images = {
          image-nvim.enable = false;
          img-clip.enable = false;
        };
      };

      notes = {
        obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
        neorg.enable = false;
        orgmode.enable = false;
        mind-nvim.enable = false;
        todo-comments.enable = false;
      };

      terminal = {
        toggleterm = {
          enable = false;
          lazygit.enable = false;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = false;
        colorizer.enable = true;
        modes-nvim.enable = false; # the theme looks terrible with catppu
        illuminate.enable = true;
        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            # this is a freeform module, it's `buftype = int;` for configuring column position
            nix = "110";
            ruby = "120";
            java = "130";
            go = ["90" "130"];
            ts = "80";
          };
        };
        fastaction.enable = false;
      };

      assistant = {
        chatgpt.enable = false;
        copilot = {
          enable = true;
          cmp.enable = true;
        };
        codecompanion-nvim.enable = false;
        avante-nvim.enable = false;
      };

      session = {
        nvim-session-manager.enable = false;
      };

      gestures = {
        gesture-nvim.enable = false;
      };

      comments = {
        comment-nvim.enable = false;
      };

      presence = {
        neocord.enable = false;
      };

      clipboard = {
        enable = true;
        providers.xclip.enable = true;
        registers = "unnamedplus";
      };
    };

    settings.vim.extraPlugins = with pkgs.vimPlugins; {
      vim-tmux-navigator = {
        package = vim-tmux-navigator;
      };
    };
  }; # programs.nvf
}
