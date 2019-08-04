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
    kitty
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
    dzen2
    dmenu2
    font-awesome-ttf
    gnome-themes-extra
    inxi
    material-icons
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
    julia
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
      material-icons 
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Fira Mono" "Iosevka Nerd Font" "Font Awesome" "Material Icons" ];
        sansSerif = [ "Fira Sans" ];
        serif     = [ "Fira Sans" ];
      };
    };
  };
}

