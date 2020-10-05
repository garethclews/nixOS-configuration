# network related options
{ config, lib, pkgs, ... }:

{
  networking = {
    useDHCP = false;
    interfaces = {
     enp3s0.useDHCP = true;
    };
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
