{ suites, ... }:
{
  ### root password is empty by default ###
  imports = suites.remotedev ++ [ ./NixOS-files/hardware-configuration.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";

  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;

}
