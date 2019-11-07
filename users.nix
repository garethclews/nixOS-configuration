# user configuration
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;

  users.users.aloysius = {
    isNormalUser = true;
    isSystemUser = false;
    extraGroups = [ "wheel" "transmission" "audio"];
  };

  users.users.samboy = {
    isNormalUser = true;
    isSystemUser = false;
  };
}
