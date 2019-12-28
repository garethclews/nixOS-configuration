# central configuration
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./drives.nix
    ./networking.nix
    ./software.nix
    ./users.nix
    ./services.nix
  ];

  boot.cleanTmpDir = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    useOSProber = true;
    backgroundColor = "#2e3440";
    font = "\${pkgs.fira-mono}/share/fonts/opentype/FiraMono-Regular.otf";
    gfxmodeEfi = "2560x1440";
    splashImage = "/media/dipper/Images/tela.jpg";
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = false;
  hardware.sane.enable = true;

  time.timeZone = "Europe/London";

  # NOTE: security.pam.services.{lightdm,gdm}.enableGnomeKeyring don't work for me
  security.pam.services = [ 
    { name = "gnome_keyring";
      text = ''
        auth     optional    ${pkgs.gnome3.gnome_keyring}/lib/security/pam_gnome_keyring.so
        session  optional    ${pkgs.gnome3.gnome_keyring}/lib/security/pam_gnome_keyring.so auto_start
        password  optional   ${pkgs.gnome3.gnome_keyring}/lib/security/pam_gnome_keyring.so
      '';
    }
  ];

  i18n = {
     consoleFont   = "Lat2-Terminus10";
     consoleKeyMap = "uk";
     defaultLocale = "en_GB.UTF-8";   
  }; 

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
