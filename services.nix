# systemd type operations
{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  services = {
    # udev.packages = [ pkgs.platformio ];

    # lorri
    lorri.enable = true;

    # glitz
    xserver = {
      enable = true;
      xkb.layout = "gb";

      displayManager = {
	gdm = {
	  enable = true;
          wayland = true;
        };
      };

      desktopManager = {
        gnome.enable = true;
        xterm.enable = false;
      };

      videoDrivers = [ "nvidia" ];

      excludePackages = with pkgs; [ xterm ];
    };

    # databases
    postgresql = { enable = true; };
  };
}
