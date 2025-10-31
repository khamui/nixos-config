{
  pkgs,
  nvf,
  ...
}: {
  imports = [nvf.homeManagerModules.default];

  # inside your NixOS module list (flake.nix's nixosSystem.modules or configuration.nix)
  programs.nvf = {
    enable = true;

    settings.vim = {
      luaConfigRC.myconfig = {
        config = ''
          dofile(vim.fn.expand("~/.config/nvf/lua/init.lua"))
        '';
        after = ["base"];
      };

      # Alias Config
      viAlias = true;
      vimAlias = true;

      # Options Config
      options = {
        #termguicolors = true;
        #hls = false;
        #splitbelow = true;
        #splitright = true;
        #colorcolumn = "80"; tabstop = 2;
        #shiftwidth = 0;
        #softtabstop = 2;
        #guicursor = "n-c:block,i-ci:ver50,r-cr-v-ve:hor80,o:hor50,a:blinkwait100-blinkoff150-blinkon150-Cursor";
      };

      # LSP Config
      lsp = {
        enable = true;

        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = true;
      };

      # LSP Languages Config
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        html.enable = true;
        tailwind.enable = true;
        ts.enable = true;
        css.enable = true;
      };

      # Statusline Config
      statusline = {
        lualine = {
          enable = true;
          theme = "github_light";
        };
      };

      # Colorscheme Config
      #theme = {
      #  enable = true;
      #  name = "github";
      #  style = "light";
      #  transparent = true;
      #};

      # Autocomplete Config
      autocomplete = {
        nvim-cmp.enable = true;
      };
    };
  }; # programs.nvf
}
