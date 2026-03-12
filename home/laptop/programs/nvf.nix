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

      # ── Keymaps ──
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

      # ── LSP ──
      lsp = {
        enable = true;
        formatOnSave = true;
        lspsaga.enable = true;
      };

      # ── Formatter ──
      formatter.conform-nvim = {
        enable = true;
        setupOpts.formatters_by_ft = {
          html = ["prettier"];
          htmlangular = ["prettier"];
        };
      };

      # ── Languages ──
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        bash.enable = true;
        css.enable = true;
        html = {
          enable = true;
          treesitter.enable = true;
          lsp.enable = false; # superhtml doesn't understand Angular template syntax
          format.enable = false; # using prettier via conform-nvim instead
          extraDiagnostics.enable = false; # htmlhint complains about missing doctype in Angular templates
        };
        ts = {
          enable = true;
          treesitter.enable = true;
        };
        lua.enable = true;
        tailwind.enable = true;
      };

      # ── Visuals ──
      visuals = {
        nvim-web-devicons.enable = true;
        fidget-nvim.enable = true;
        indent-blankline.enable = true;
      };

      # ── Statusline ──
      statusline.lualine = {
        enable = true;
        theme = "tokyonight";
      };

      # ── Theme ──
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

      # ── Autocomplete ──
      autocomplete.nvim-cmp.enable = true;

      snippets.luasnip.enable = true;

      # ── Filetree ──
      filetree.neo-tree.enable = true;

      # ── Treesitter ──
      treesitter.highlight.enable = true;

      telescope.enable = true;

      # ── Git ──
      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
        neogit.enable = true;
      };

      # ── Utility ──
      utility = {
        diffview-nvim.enable = true;
        surround.enable = true;
        smart-splits.enable = true;
        motion.hop.enable = true;
      };

      # ── UI ──
      ui = {
        borders.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            nix = "110";
            ruby = "120";
            java = "130";
            go = ["90" "130"];
            ts = "80";
          };
        };
      };

      # ── AI Assistant ──
      assistant.copilot = {
        enable = true;
        cmp.enable = true;
      };

      # ── Clipboard ──
      clipboard = {
        enable = true;
        providers.xclip.enable = true;
        registers = "unnamedplus";
      };

      # ── Custom Lua Config ──
      luaConfigRC.angular-filetype = ''
        vim.filetype.add({
          extension = {
            html = "htmlangular",
          },
        })
      '';

      luaConfigRC.tsx-syntax = ''
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {"typescriptreact", "javascriptreact"},
          callback = function()
            vim.bo.syntax = "typescriptreact"
          end,
        })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {"typescript", "javascript"},
          callback = function()
            vim.bo.syntax = "typescript"
          end,
        })
      '';
    };

    settings.vim.extraPlugins = with pkgs.vimPlugins; {
      vim-tmux-navigator = {
        package = vim-tmux-navigator;
      };
    };
  }; # programs.nvf
}
