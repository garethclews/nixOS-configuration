# user configuration
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      g = {
        isNormalUser = true;
        description = "Gareth";
        createHome = true;
        home = "/home/g";
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
          ghcid
          treefmt

          # LSPs and linters
          shellcheck
          irony-server

          # maths libraries
          arpack
          gnuplot
          openblas
 
          # media
          blanket
          
          # networking
          varia

          # emacs everywhere
          xdotool
          xclip          
        ];
        shell = pkgs.zsh;
        uid = 1000;
      };
    };
  };
}
