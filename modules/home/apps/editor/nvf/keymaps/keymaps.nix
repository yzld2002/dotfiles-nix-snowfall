let
  general = import ./general.nix;
  fzf = import ./fzf.nix;
  neotree = import ./neotree.nix;
in
  general
  ++ fzf
  ++ neotree
