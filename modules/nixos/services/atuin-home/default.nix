{ options, config, lib, ... }:
with lib;
with lib.custom;
let cfg = config.services.atuin-home;
in {
  options.services.atuin-home = with types; {
    enable = mkBoolOpt false "Enable Autin";
  };

  config = mkIf cfg.enable {
    services.atuin = {
      enable = true;
      openRegistration = true;
      openFirewall = true;
      host = "192.168.50.21";
      database.createLocally = true;
    };
  };
}
