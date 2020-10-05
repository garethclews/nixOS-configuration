# systemd type operations
{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  services = {
    udev.packages = [ pkgs.platformio ];

    # VPN
    openvpn.servers = {
      home = {
        #uk
        autoStart = true;
        config = ''
          config /root/.vpn/udp/uk1769.nordvpn.com.udp.ovpn
          auth-user-pass /root/.vpn/aloysius.key
          auth-nocache
        '';
      };

      muri = {
        # us
        autoStart = false;
        config = ''
          config /root/.vpn/udp/us5341.nordvpn.com.udp.ovpn
          auth-user-pass /root/.vpn/aloysius.key
          auth-nocache
        '';
      };
    };

    # lorri
    lorri.enable = false;

    # antivirus
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    # torrent
    transmission = {
      enable = true;

      user = "aloysius";
      home = "/home/aloysius";
      settings = {
        download-dir = "/home/aloysius/Downloads/torrents";
        incomplete-dir-enabled = false;
        rename-partial-files = false;
        #        watch-dir-enabled = true;
        #        watch-dir = "/home/aloysius/Downloads";
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
          enable = false;
          nvidiaWayland = true;
          wayland = true;
        };
        lightdm = {
          enable = true;
          background = "/media/dipper/Images/tela.jpg";
          greeters = {
            gtk = {
              enable = true;
              cursorTheme = {
                package = pkgs.vanilla-dmz;
                name = "Vanilla-DMZ";
              };
              iconTheme = {
                package = pkgs.paper-icon-theme;
                name = "Paper";
              };
              indicators = [ "~clock" "~spacer" "~session" "~power" ];
            };
          };
        };
      };

      desktopManager = {
        gnome3.enable = true;
        xterm.enable = false;
      };

      windowManager = {
        awesome.enable = true;
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

    # bus
    dbus = { packages = [ pkgs.gutenprint pkgs.gnome3.dconf ]; };

    gnome3.sushi.enable = true;

    # system printing services
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };

    # databases
    postgresql = { enable = true; };
  };
}
