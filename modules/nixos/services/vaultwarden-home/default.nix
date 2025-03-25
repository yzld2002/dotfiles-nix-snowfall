{ options, config, lib, ... }:
with lib;
with lib.custom;
let cfg = config.services.vaultwarden-home;
in {
  options.services.vaultwarden-home = with types; {
    enable = mkBoolOpt false "Enable Vaultwarden";
  };

  config = mkIf cfg.enable {
    services.vaultwarden = {
      enable = true;
      environmentFile = "${config.age.secrets.vaultwarden.path}";
      backupDir = "/var/backup/vaultwarden";
      config = {
        DOMAIN = "https://vaultwarden.20190915.xyz";
        SIGNUPS_ALLOWED = true;
        ROCKET_ADDRESS = "0.0.0.0";
      };
    };
  };
}
