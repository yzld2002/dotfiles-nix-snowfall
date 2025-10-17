{ options, config, lib, pkgs, inputs, ... }:
with lib;
with lib.custom;
let cfg = config.apps.editor.nvf;
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
        vim.viAlias = false;
        vim.vimAlias = true;
        vim.lsp = {
          enable = true;
        };
      };
    };
  };
}
