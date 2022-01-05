# software choices
{ config, lib, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basics
    bat # cat with wings
    binutils
    curl
    coreutils
    dfc
    direnv
    editorconfig-core-c
    git
    gnupg
    imagemagick
    zsh
    zsh-autosuggestions
    zsh-command-time
    zsh-completions
    zlib
    p7zip
    unzip
    fd
    kitty
    pass
    openssl
    ripgrep
    redshift
    sqlite
    trash-cli # never rm again!

    # dev
    emacs
    gcc
    gnumake
    clang
    vim

    # glitz
    cava
    dzen2
    libnotify
    font-awesome-ttf
    mplus-outline-fonts
    gtk-engine-murrine
    i3lock-color
    inxi
    material-icons
    polybar
    paper-icon-theme
    vanilla-dmz
    wmctrl

    # haskell
    ghc
    cabal-install
    # cabal2nix
    hlint

    # lisps
    # clisp
    # sbcl

    # not haskell
    # julia
    # sqlite

    # media
    playerctl
    sonarr
    ffmpeg
    mpv
    # obs-studio
    # appimage-run # plexamp is in ~/.scripts
    spotify

    # web office
    libreoffice-fresh
    discord
    signal-desktop
    firefox
    texlive.combined.scheme-medium
    poppler
    groff
    ghostscript
    graphviz
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
  ];

  programs = {
    zsh.enable = true;
    steam.enable = true;

    # get that new WM sorted
    sway = {
      enable = true;
      wrapperFeatures.gtk = true; # so that gtk works properly
      extraOptions = [ "--my-next-gpu-wont-be-nvidia" ];
      extraPackages = with pkgs; [
        swaylock
        swayidle
        wl-clipboard
        mako # notification daemon
        alacritty # Alacritty is the default terminal in the config
        dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
        wofi # gonna try it at least
      ];
    };
  };

  fonts = {
    # fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      # fira
      # fira-mono
      # fira-code-symbols
      font-awesome-ttf
      hasklig
      # ipafont
      # kochi-substitute
      # dejavu_fonts
      material-icons
      overpass
      mplus-outline-fonts
    ];

    fontconfig = {
      defaultFonts = {
        monospace =
          [ "hasklig" "Iosevka Nerd Font" "Font Awesome" "Material Icons" ];
        sansSerif = [ "Overpass" ];
        serif = [ "Overpass" ];
      };
    };
  };
}

