let
  general = import ./general.nix;
  fzf = import ./fzf.nix;
  neotree = import ./neotree.nix;
  snacks = import ./snacks.nix;
in
  general
  ++ fzf
  ++ neotree
  ++ snacks
