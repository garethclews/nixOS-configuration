# user configuration
{ config, lib, pkgs, ... }:

let
  dmenu-aloy = pkgs.dmenu.override {
    patches = builtins.map builtins.fetchurl [
      {
        url =
          "https://tools.suckless.org/dmenu/patches/mouse-support/dmenu-mousesupport-4.9.diff";
        sha256 = "04lj0wwa6gscw1l2s7iq59zzfxk1i160bxacpvp2klnl764hf4jy";
      }
      {
        url =
          "https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-4.9.diff";
        sha256 = "0v609mmz3i5dlfdf4b8wcp48njxp1i5g5vy7phw3zg1wn936yzsg";
      }
      {
        url =
          "https://tools.suckless.org/dmenu/patches/numbers/dmenu-numbers-4.9.diff";
        sha256 =
          "f79de21544b83fa1e86f0aed5e849b1922ebae8d822e492fbc9066c0f07ddb69";
      }
      {
        url =
          "https://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-4.9.diff";
        sha256 = "0yababzi655mhpgixzgbca2hjckj16ykzj626zy4i0sirmcyg8fr";
      }
    ];
  };

  rEnv = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      tidyverse
      DescTools
      styler
      rmarkdown
      knitr
    ];
  };
in {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      aloysius = {
        isNormalUser = true;
        description = "Aloysius";
        createHome = true;
        home = "/home/aloysius";
        group = "aloysius";
        extraGroups = [ "wheel" "audio" "transmission" "plex" "dialout" ];
        packages = with pkgs; [
          # generic
          weechat
          feh
          maim
          libvterm
          material-icons
          nixfmt
          niv
          rtags
          numlockx
          tty-clock
          xclip
          xdotool
          wordnet
          xsettingsd
          obconf

          # office
          mu
          isync
          notmuch
          afew

          # gnome
          gnome3.gnome-session
          arc-theme

          # haskell packages
          haskellPackages.brittany
          haskellPackages.pandoc
          haskellPackages.hoogle

          # LSPs and linters
          shellcheck
          irony-server

          # maths libraries
          arpack
          gnuplot
          openblas
          liblapack
          rEnv

          # media
          ncmpcpp
          mpc_cli
          # appimage-run

          # steam

          # custom
          dmenu-aloy

        ];
        shell = pkgs.zsh;
        uid = 1000;
      };

      samboy = {
        isNormalUser = true;
        description = "Samsquatch";
        createHome = true;
        home = "/home/samboy";
        uid = 1001;
      };
    };
  };
}
