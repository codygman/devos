{ suites, pkgs, ... }:
{
  ### root password is empty by default ###
  imports = suites.remotedev ++ [ ./razer-hardware-configuration.nix ];
  # TODO should I just put the hardware configuration in this host file?

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "razer"; # Define your hostname.
  networking.networkmanager = {
    enable = true;
    packages = [ pkgs.networkmanager_openvpn ];
  };

  programs.nm-applet = {
    indicator = true;
    enable = true;
  };

  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  location.provider = "manual";
  location.latitude = 32.7767;
  location.longitude = -96.7970;

  services.redshift = {
    enable = true;
    brightness = {
      day = "1.0";
      night = "0.7";
    };
    temperature = {
      day = 6500;
      night = 3801;
    };
    extraOptions = ["-v"];
  };

}
