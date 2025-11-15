{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.editor.nvf;
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
          utility = {
            sleuth.enable = true;
            smart-splits.enable = true;
            snacks-nvim.enable = true;
          };
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
            toggleterm = {
              enable = true;
              lazygit.enable = true;
              setupOpts = {
                insert_mappings = true;
                terminal_mappings = true;
                direction = "float";
              };
            };
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
          keymaps = import ./keymaps/keymaps.nix;
        };
      };
    };
  };
}
