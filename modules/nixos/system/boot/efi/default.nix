{
  options,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.system.boot.efi;
in {
  options.system.boot.efi = with types; {
    enable = mkBoolOpt false "Whether or not to enable efi booting.";
  };

  config = mkIf cfg.enable {
    boot.loader.grub = {
      # no need to set devices, disko will add all devices that have a EF02 partition to the list already
      # devices = [ ];
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };
}
