# systemd type operations
{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  services = {
   
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    transmission = {
      enable = true;
      settings = {
        blocklist-enabled = true;
        blocklist-url = "http://john.bitsurge.net/public/biglist.p2p.gz";
        peer-port-random-on-start = true;
        encryption = 1;
        pex-enabled = true;
        port-forwarding-enabled = true;
        ratio-limit = 2;
        ratio-limit-enabled = true;
        start-added-torrents = true;
        trash-original-torrent-files = true;
      };
    };

    sonarr = {
      enable = true;
      user = "aloysius";
      group = "plex";
    };

    plex = {
      enable = true;
      user = "aloysius";
      package = (import (fetchTarball { 
        url = "https://github.com/NixOS/nixpkgs/tarball/a27a14da2a592402ecb89abc040700b2cf90d3c7";
        sha256 = "0ji1rca0pmfma7qr4lllfgrks5am22lg0fdmr551vzdjx2rnksn0"; 
      }) {config.allowUnfree = true; }).plex;
    };

    xserver = {
      enable = true;
      layout = "gb";

      displayManager = {
        gdm = {
          enable = false; # true;
          wayland = false; # NVIDIA drivers don't support it :(
        };
        lightdm = {
          enable = true;
          background = "/media/dipper/Images/goat.jpg";
          # other options
          greeters.gtk = {
            theme = {
              package = pkgs.nordic;
              name = "Nordic";
            };
            iconTheme = {
              package = pkgs.paper-icon-theme;
              name = "Paper";
            };
            indicators = [ "~host" "~spacer"
                           "~clock" "~spacer"
                           "~session" "~power" ];
          };
        };
      };

      desktopManager = {
        gnome3.enable = true;
        xterm.enable = false;
      };

      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          extraPackages = with pkgs; [
            i3status
            i3lock-color
            i3blocks ];
        };

        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          extraPackages = haskellPackages: [
            haskellPackages.xmonad-contrib
            haskellPackages.xmonad-extras
            haskellPackages.xmonad-screenshot
            haskellPackages.xmonad-utils
            haskellPackages.xmonad-volume
            haskellPackages.xmonad
          ];
        };
      };

      videoDrivers = [ "nvidia" ];
    };

    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };

    postgresql = {
      enable = true;
    };
  };
}
