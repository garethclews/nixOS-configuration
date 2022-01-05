# systemd type operations
{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  services = {
    # VPN
    #    openvpn.servers = {
    #      home = {
    #uk
    #        autoStart = true;
    #        config = ''
    #          config /root/.vpn/udp/uk.nord.ovpn
    #          auth-user-pass /root/.vpn/aloysius.key
    #          auth-nocache
    #        '';
    #      };

    #      muri = {
    # us
    #        autoStart = false;
    #        config = ''
    #          config /root/.vpn/udp/us.nord.ovpn
    #          auth-user-pass /root/.vpn/aloysius.key
    #          auth-nocache
    #        '';
    #      };

    #      cand = {
    # canada
    #        autoStart = false;
    #        config = ''
    #          config /root/.vpn/udp/ca.nord.ovpn
    #          auth-user-pass /root/.vpn/aloysius.key
    #          auth-nocache
    #        '';
    #      };
    #    };

    # antivirus
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    # lorri
    lorri.enable = true;

    # torrent
    transmission = {
      enable = true;

      user = "aloysius";
      home = "/home/aloysius";
      settings = {
        download-dir = "/home/aloysius/Downloads/torrents";
        incomplete-dir-enabled = false;
        rename-partial-files = false;
        blocklist-url = "http://john.bitsurge.net/public/biglist.p2p.gz";
        blocklist-enabled = true;
        peer-port-random-on-start = true;
        encryption = 2;
        pex-enabled = true;
        port-forwarding-enabled = true;
        ratio-limit = 2;
        ratio-limit-enabled = true;
        start-added-torrents = true;
        trash-original-torrent-files = true;
      };
    };

    # media watchlist+snatcher
    sonarr = {
      enable = true;
      user = "aloysius";
      group = "plex";
    };

    # media platform
    plex = {
      enable = true;
      user = "aloysius";
    };

    # glitz
    xserver = {
      enable = true;
      layout = "gb";

      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
          nvidiaWayland = false;
        };
      };

      desktopManager = {
        gnome.enable = true;
        xterm.enable = false;
      };

      # videoDrivers = [ "nvidia" ];
    };

    # gnome shit for integration
    gnome = {
      core-os-services.enable = true;
      core-shell.enable = true;
      core-utilities.enable = true;
    };

    # bus
    dbus = { packages = [ pkgs.gnome.dconf ]; };
    gnome.sushi.enable = true;
  };
}
