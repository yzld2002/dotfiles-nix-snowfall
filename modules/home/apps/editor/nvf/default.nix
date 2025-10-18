{ options, config, lib, pkgs, inputs, ... }:
with lib;
with lib.custom;
let
cfg = config.apps.editor.nvf;
fzfLuaKeymap = [
  { key = "<leader>ff"; mode = ["n"]; action = ":FzfLua files<CR>"; desc = "files"; }
  { key = "<leader>fg"; mode = ["n"]; action = ":FzfLua git_files<CR>"; desc = "git files"; }
  { key = "<leader>fb"; mode = ["n"]; action = ":FzfLua buffers<CR>"; desc = "buffers"; }
  { key = "<leader>sg"; mode = ["n"]; action = ":FzfLua grep<CR>"; desc = "Pick - Live Grep"; }
  { key = "<leader>sw"; mode = ["n"]; action = ":FzfLua grep_cword<CR>"; desc = "Pick - Grep word under cursor"; }
  { key = "<leader>sw"; mode = ["v"]; action = ":FzfLua grep_cword<CR>"; desc = "Pick - Grep word under cursor"; }
  { key = "<leader>sr"; mode = ["n"]; action = ":FzfLua resume<CR>"; desc = "Resume"; }
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
        vim.viAlias = false;
        vim.vimAlias = true;
        vim.lsp = {
          enable = true;
        };
        vim.binds.whichKey = {
          enable = true;
        };
        vim.fzf-lua = {
          enable = true;
          profile = "telescope";
        };
        vim.git.enable = true;
        vim.terminal = {
          toggleterm.enable = true;
          toggleterm.lazygit.enable = true; 
        };
        
        # keymaps
        vim.keymaps = fzfLuaKeymap;
      };
    };
  };
}
