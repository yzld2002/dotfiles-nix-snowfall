{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.editor.nvf;
  fzfLuaKeymap = [
    {
      key = "<leader>ff";
      mode = ["n"];
      action = ":FzfLua files<CR>";
      desc = "files";
    }
    {
      key = "<leader> ";
      mode = ["n"];
      action = ":FzfLua files<CR>";
      desc = "files";
    }
    {
      key = "<leader>fg";
      mode = ["n"];
      action = ":FzfLua git_files<CR>";
      desc = "git files";
    }
    {
      key = "<leader>gs";
      mode = ["n"];
      action = ":FzfLua git_diff<CR>";
      desc = "git files";
    }
    {
      key = "<leader>fb";
      mode = ["n"];
      action = ":FzfLua buffers<CR>";
      desc = "buffers";
    }
    {
      key = "<leader>sg";
      mode = ["n"];
      action = ":FzfLua grep<CR>";
      desc = "Pick - Live Grep";
    }
    {
      key = "<leader>sw";
      mode = ["n"];
      action = ":FzfLua grep_cword<CR>";
      desc = "Pick - Grep word under cursor";
    }
    {
      key = "<leader>sw";
      mode = ["v"];
      action = ":FzfLua grep_cword<CR>";
      desc = "Pick - Grep word under cursor";
    }
    {
      key = "<leader>sr";
      mode = ["n"];
      action = ":FzfLua resume<CR>";
      desc = "Resume";
    }
  ];
  neotreeKeymap = [
    {
      key = "<leader>e";
      mode = ["n"];
      action = ":Neotree toggle<CR>";
      desc = "Neotree";
    }
  ];
in {
  options.apps.editor.nvf = with types; {
    enable = mkBoolOpt false "Enable nvf based neovim";
  };

  config = mkIf cfg.enable {
    programs.nvf = {
      enable = true;
      # your settings need to go into the settings attribute set
      # most settings are documented in the appendix
      settings = {
        vim = {
          theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
          };
          statusline.lualine.enable = true;
          filetree.neo-tree.enable = true;
          viAlias = false;
          vimAlias = true;
          utility.sleuth.enable = true;
          clipboard = {
            enable = true;
            providers.wl-copy.enable = true;
            registers = "unnamedplus"; # uses system clipboard
          };

          binds.whichKey = {
            enable = true;
          };
          fzf-lua = {
            enable = true;
            profile = "telescope";
          };
          git.enable = true;
          terminal = {
            toggleterm.enable = true;
            toggleterm.lazygit.enable = true;
          };
          lsp = {
            enable = true;
            formatOnSave = true;
            inlayHints.enable = true;
            trouble.enable = true;
            otter-nvim.enable = true;
          };
          autocomplete.blink-cmp = {
            enable = true;
            sourcePlugins = {
              emoji.enable = true;
            };
          };

          languages = {
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;
            enableDAP = true;

            tailwind.enable = true;
            ts = {
              enable = true;
              extensions = {
                ts-error-translator.enable = true;
              };
            };
            nix.enable = true;
            yaml.enable = true;
          };

          # keymaps
          keymaps = fzfLuaKeymap ++ neotreeKeymap;
        };
      };
    };
  };
}
