{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.suites.gui;
in {
  options.suites.gui = with types; {
    enable = mkBoolOpt false "Enable the gui suite";
  };

  config = mkIf cfg.enable {
    hardware.audio.enable = true;
    hardware.networking.enable = true;

    hardware.bluetooth.enable = true;
    hardware.bluetooth.settings = {
      General = {
        FastConnectable = true;
        JustWorksRepairing = "always";
        Privacy = "device";
      };
      Policy = {
        AutoEnable = true;
      };
    };

    programs.dconf.enable = true;
    desktop.kde.enable = true;
    desktop.fonts.enable = true;
    desktop.input.enable = true;
    desktop.softwares.enable = true;

    system = {
      # fonts.enable = true;
      locale.enable = true;
      time.enable = true;
    };
  };
}
