# central configuration
{ config, pkgs, ... }:

{
  imports = [
    ./cachix.nix
    ./hardware-configuration.nix
    ./drives.nix
    ./networking.nix
    ./programs.nix
    ./users.nix
    ./services.nix
  ];

  boot.cleanTmpDir = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  hardware.bluetooth.enable = true;
  hardware.sane.enable = true;
  hardware.nvidia.modesetting.enable = true;

  time.timeZone = "Europe/London";

  console = { keyMap = "uk"; };
  i18n.defaultLocale = "en_GB.UTF-8";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # steam compat
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  nixpkgs.config.allowUnfree = true;
  nix.gc.automatic = true;
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.03"; # Did you read the comment?
  system.autoUpgrade.enable = true;
}
