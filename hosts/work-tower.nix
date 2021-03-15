{ suites, pkgs, ... }:
{
  imports = [
    ./work-tower/configuration.nix
  ] ++ suites.remotedev;


  networking.networkmanager = {
    enable = true;
    packages = [ pkgs.networkmanager_openvpn ];
  };

  programs.nm-applet = {
    indicator = true;
    enable = true;
  };

}
