# systemd type operations
{ config, lib, pkgs, ... }:

{
  # List services that you want to enable:
  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:3000";
    notificationSender = "hydra@localhost";
    buildMachinesFiles = [];
    useSubstitutes = true;
  };
}
