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
    backgroundColor = "#2e3440";
    font = "\${pkgs.fira-mono}/share/fonts/opentype/FiraMono-Regular.otf";
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = true;

  i18n = {
    consoleFont = "Lat2-Terminus10";
    consoleKeyMap = "uk";
    defaultLocale = "en_GB.UTF-8";
  };

  time.timeZone = "Europe/London";

  security.hideProcessInformation = true;
  security.pam.enableGnomeKeyring = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.gc.automatic = true;
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
  system.autoUpgrade.enable = true;
}
