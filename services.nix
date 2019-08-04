# systemd type operations
{ config, lib, pkgs, ... }:
{
  # dconf enabler
  programs.dconf.enable = true;

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
                           "~session" "~a11y" "~power"
                         ];
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
	    rofi
            i3status
            i3lock-fancy
            i3blocks
	  ];
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

    dbus = {
      packages = [ pkgs.gutenprint pkgs.gnome3.dconf ];
    };

    gnome3 = {
      gnome-keyring.enable = true;
      seahorse.enable = true;
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
