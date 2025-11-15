[
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
    action = ":FzfLua live_grep<CR>";
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
]
