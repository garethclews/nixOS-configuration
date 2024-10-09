# software choices
{ config, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basics
    bat
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
    pass
    openssl
    ripgrep
    trash-cli
    shfmt

    # dev
    devenv
    emacs
    gcc
    gnumake
    clang
    vim
    ccls
    tidyp             # HTML code formatting
    stylelint         # CSS linter
    just

    # glitz
    font-awesome
    source-code-pro
    material-icons
    # paper-icon-theme
    # vanilla-dmz

    # haskell
    ghc
    cabal-install
    hlint
    haskell-language-server
    haskellPackages.fourmolu
    pandoc

    # lisps
    # clisp
    # sbcl

    # media
    # playerctl
    ffmpeg
    spotify


    # web office
    whatsapp-for-linux
    languagetool
    discord-canary
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
  };

  fonts = {
    enableGhostscriptFonts = true;
    packages = with pkgs; [ font-awesome hasklig ];

    fontconfig = {
      defaultFonts = {
        monospace =
          [ "hasklig" "Iosevka Nerd Font" "Font Awesome" "Material Icons" ];
        sansSerif = [ "Mplus" ];
        serif = [ "Mplus" ];
      };
    };
  };
}

