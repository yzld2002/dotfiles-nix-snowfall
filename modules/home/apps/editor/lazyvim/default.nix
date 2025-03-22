{ options, config, lib, pkgs, inputs, ... }:
with lib;
with lib.custom;
let cfg = config.apps.editor.lazyvim;
in {
  options.apps.editor.lazyvim = with types; {
    enable = mkBoolOpt false "Enable lazyvim";
  };

  config = mkIf cfg.enable {
    home.packages =
      [ inputs.nixcats-nvim-lazyvim-config.packages.${pkgs.system}.nvim ];
  };
}
