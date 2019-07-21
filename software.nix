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
    gcc
    gnumake
    jq
    yq
    meld
    vim

    # glitz
    awesome
    cava
    compton
    dunst
    dzen2
    dmenu2
    font-awesome-ttf
    gnome-themes-extra
    inxi
    lemonbar-xft
    polybar
    paper-icon-theme
    vanilla-dmz
    wmctrl

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
    sqlite

    # media
    playerctl
    plex
    sonarr
    spotify
    mpv

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
      dejavu_fonts
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Fira Mono" "Iosevka Nerd Font" "Font Awesome" ];
        sansSerif = [ "Fira Sans" ];
        serif     = [ "Fira Sans" ];
      };
    };
  };
}

