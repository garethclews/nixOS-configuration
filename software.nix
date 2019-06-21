# software choices
{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basics
    curl
    git
    zsh
    rxvt_unicode
    fd    
    libnotify

    # dev
    vim
    emacs
    gnumake
    jq

    # glitz
    vanilla-dmz

    # haskell
    ghc
    cabal-install
    haskellPackages.ghcid
    
    # not haskell
    julia
    R
    python3

    # media
    plex
    sonarr
    spotify

    # comms
    discord
    gimp
    imagemagick

    # web office
    libreoffice-fresh
    gimp
    firefox
  ];

  programs = {
    zsh.enable = true;
    bash.enableCompletion = true;
    tmux = {
      enable = true;
      newSession = true;
    };
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      fira
      fira-mono
      fira-code-symbols
      font-awesome-ttf
      source-code-pro
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Fira Mono" "Source Code Pro" "TypIcons" ];
        sansSerif = [ "Fira Sans" ];
        serif     = [ "Fira Sans" ];
      };
    };
  };
}

