{ suites, ... }:
{
  imports = suites.remotedev ++ [ ./tower-hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NOTE: won't this get set to the name of this file automatically by devos?
  # networking.hostName = "nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp24s0.useDHCP = true;
  #networking.interfaces.vboxnet0.useDHCP = true;
  networking.interfaces.wlp26s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  system.stateVersion = "20.09"; # Did you read the comment?
}
