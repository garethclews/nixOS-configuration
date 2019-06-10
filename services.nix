# systemd type operations
{ config, lib, pkgs, ... }:

{
  # List services that you want to enable:
  services = {
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
    };

    xserver = {
      enable = true;

      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };
      };

      displayManager = {
        gdm = {
          enable = true;
          wayland = false; # NVIDIA drivers don't support it :(
        };
      };
      desktopManager.gnome3.enable = true;
      desktopManager.xterm.enable = false;

      videoDrivers = [ "nvidia" ];
    };

    gnome3 = {
      gnome-keyring.enable = true;
    };

    printing = {
      enable = true;
    };

    postgresql = {
      enable = true;
    };

  };
}
