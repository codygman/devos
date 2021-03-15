{ suites, pkgs, ... }:
{
  imports = [
    ./work-tower/configuration.nix
  ] ++ suites.remotedev;


  networking.hostName = "work-tower"; # Define your hostname.
  networking.networkmanager = {
    enable = true;
    packages = [ pkgs.networkmanager_openvpn ];
  };

  programs.nm-applet = {
    indicator = true;
    enable = true;
  };

}
