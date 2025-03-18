{pkgs, modulesPath, ...}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware.nix
    ./disk.nix
  ];

  # Enable Bootloader
  system.boot.efi.enable = true;

  environment.systemPackages = with pkgs; [
    # Any particular packages only for this host
    curl
  ];

  suites.server.enable = true;

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.05";
  # ======================== DO NOT CHANGE THIS ========================
}
