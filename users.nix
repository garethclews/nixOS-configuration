# user configuration
{ config, lib, pkgs, ... }:

let
  dmenu-aloy = pkgs.dmenu.override {
    patches = builtins.map builtins.fetchurl [
       { url = "https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-4.9.diff";
         sha256 = "0v609mmz3i5dlfdf4b8wcp48njxp1i5g5vy7phw3zg1wn936yzsg"; }
       { url="https://tools.suckless.org/dmenu/patches/numbers/dmenu-numbers-4.9.diff";
         sha256 = "f79de21544b83fa1e86f0aed5e849b1922ebae8d822e492fbc9066c0f07ddb69"; }
       { url = "https://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-4.9.diff";
         sha256 = "0yababzi655mhpgixzgbca2hjckj16ykzj626zy4i0sirmcyg8fr"; }
    ]; };
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      aloysius = {
        isNormalUser = true;
        description  = "Aloysius";
        createHome   = true;
        home         = "/home/aloysius";
        extraGroups  = [ "wheel" "transmission" "audio" "plex" ];
        packages     = with pkgs; [
                         styx
                         weechat
                         cawbird
                         feh
                         maim
                         material-icons
                         numlockx
                         tty-clock
                         xclip
                         xdotool
                         
                         gnome3.geary
 
                         haskellPackages.brittany
                         haskellPackages.pandoc
                         haskellPackages.hoogle

                         # custom
                        dmenu-aloy
                      ];
        shell       = pkgs.zsh;
        uid         = 1000;
      };
     
      samboy = {
        isNormalUser = true;
        description  = "Samsquatch";
        createHome   = true;
        home         = "/home/samboy";
        uid          = 1001;
      };
    };
  };
}
