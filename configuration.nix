# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./drives.nix
    ./networking.nix
    ./programs.nix
    ./services.nix
    ./users.nix
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.swraid.enable = false;
  boot.tmp.cleanOnBoot = true;
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  networking.hostName = "grunklestan";
  networking.networkmanager.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";
  time.timeZone = "Europe/London";

  # system.copySystemConfiguration = true;  -- disabled for flake!
  nixpkgs.config.allowUnfree = true;

  hardware.nvidia = {
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  hardware.opengl = {
    enable = true;
    driSupport = false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  nixpkgs.config.nvidia.acceptLicense = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It’s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

