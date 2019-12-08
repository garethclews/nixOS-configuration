# network related options
{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "karasu"; # Define your hostname.
    extraHosts =
      ''
      127.0.0.1 karasu
      '';
    firewall = {
      enable = false;
      allowPing = false;
    };
  };
}
