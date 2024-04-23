# additional drives not in the standard layout
{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/media/mabel" = {
      device = "/dev/disk/by-label/mabel";
      fsType = "ntfs";
    };

    "/media/dipper" = {
      device = "/dev/disk/by-label/dipper";
      fsType = "ntfs";
    };

    "/home" = {
      device = "/dev/disk/by-label/soos";
      fsType = "ext4";
    };
  };
}
