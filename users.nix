# user configuration
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      aloysius = {
        isNormalUser = true;
        description = "Aloysius";
        createHome = true;
        home = "/home/aloysius";
        extraGroups = [ "wheel" "audio" "transmission" "plex" "dialout" ];
        packages = with pkgs; [
          # generic
          libvterm
          xorg.xwininfo # for emacs everywhere
          wordnet
          pamixer
          killall

          # haskell packages
          haskellPackages.stylish-haskell
          haskellPackages.pandoc
          haskellPackages.hoogle

          # LSPs and linters
          shellcheck
          irony-server

          # maths libraries
          arpack
          gnuplot
          openblas
 
          # media
          blanket
          varia
        ];
        shell = pkgs.zsh;
        uid = 1000;
      };
    };
  };
}
