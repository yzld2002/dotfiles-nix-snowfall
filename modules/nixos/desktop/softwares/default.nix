{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.desktop.softwares;
in {
  options.desktop.softwares = with types; { enable = mkBoolOpt false "Enable Common GUI Softwares"; };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      steam
      telegram-desktop
      obsidian
    ];
  };
}
