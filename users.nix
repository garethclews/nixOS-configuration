# user configuration
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = "/var/run/current-system/sw/bin/zsh";

  users.users.aloysius = {
    isNormalUser = true;
    extraGroups = [ "wheel" "transmission" "audio"];
  };

  users.users.samboy = {
    isNormalUser = true;
  };
}
