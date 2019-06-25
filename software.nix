# software choices
{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basics
    binutils
    curl
    dfc
    editorconfig-core-c
    git
    imagemagick
    zsh
    rxvt_unicode
    fd    
    libnotify
    openssl
    redshift

    # dev
    emacs
    gnumake
    jq
    meld
    vim

    # glitz
    cava
    compton
    dunst
    gnome-themes-extra
    inxi
    paper-icon-theme
    vanilla-dmz

    # haskell
    ghc
    cabal-install
    haskellPackages.ghcid
    hlint
    
    # not haskell
    coq
    julia
    R
    python3

    # media
    playerctl
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

