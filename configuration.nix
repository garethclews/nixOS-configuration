# central configuration
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./drives.nix
    ./networking.nix
    ./services.nix
    ./software.nix
    ./users.nix
  ];

  boot.cleanTmpDir = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    useOSProber = true;
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = true;

  time.timeZone = "Europe/London";

  security.hideProcessInformation = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.gc.automatic = true;
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
  system.autoUpgrade.enable = true;
}
