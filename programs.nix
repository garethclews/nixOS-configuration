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
    jansson
    jq
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
    trash-cli # never rm again!

    # dev
    emacs
    gcc
    gnumake
    clang
    zlib
    jq
    vim

    ccls

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
    mononoki
    polybar
    paper-icon-theme
    vanilla-dmz
    wmctrl

    # haskell
    ghc
    cabal-install
    cabal2nix
    hlint

    # lisps
    clisp
    sbcl

    # not haskell
    # julia
    sqlite
    python3

    # media
    playerctl
    sonarr
    ffmpeg
    mpv
    obs-studio
    appimage-run # plexamp is in ~/.scripts
    spotify
    #(steam.override { nativeOnly = true; })
    steam

    # comms
    gimp
    imagemagick

    # web office
    libreoffice-fresh
    blender
    inkscape
    discord
    gimp
    firefox
    gnome3.geary
    texlive.combined.scheme-medium
    poppler
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
  ];

  programs = { zsh.enable = true; };

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      fira
      fira-mono
      fira-code-symbols
      font-awesome-ttf
      hasklig
      ipafont
      kochi-substitute
      dejavu_fonts
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

