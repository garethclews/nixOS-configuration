# software choices
{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    vim
    zsh
    emacs
    firefox
    fira
    fira-code-symbols
    fira-mono
    vanilla-dmz
    plex
    sonarr
    libreoffice-fresh
    spotify
    discord
    zlib
    rxvt_unicode
    gnumake
    gcc
    gimp
    imagemagick
    ghc
    cabal-install
  ];

  programs = {
    zsh.enable = true;
    bash.enableCompletion = true;
    tmux.enable = true;
    adb.enable = true;
  };
}
