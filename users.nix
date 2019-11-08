# user configuration
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      aloysius = {
        isNormalUser = true;
        extraGroups = [ "wheel" "transmission" "audio" "plex" ];
      };

      samboy = {
        isNormalUser = true;
      };
    };
  };
}
