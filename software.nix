# software choices
{ config, lib, pkgs,  ... }:
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
    kitty
    fd    
    libnotify
    openssl
    p7zip
    ripgrep
    redshift

    # dev
    emacs
    gnumake
    jq
    meld
    python3
    vim

    # glitz
    cava
    compton
    dunst
    dzen2
    font-awesome-ttf
    gnome-themes-extra
    gtk-engine-murrine
    inxi
    material-icons
    mononoki
    polybar
    paper-icon-theme
    vanilla-dmz
    wmctrl

    # haskell
    ghc
    cabal-install
    haskellPackages.ghcid
    hlint

    # lisps
    clisp
    sbcl
    
    # not haskell
    julia
    sqlite

    # media
    playerctl
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
    keybase-gui
    firefox
    ispell
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
      mononoki
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Fira Mono" "Iosevka Nerd Font" "mononoki" "Font Awesome" "Material Icons" ];
        sansSerif = [ "Fira Sans" ];
        serif     = [ "Fira Sans" ];
      };
    };
  };
}

