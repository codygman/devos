{ pkgs, config, lib, ... }:
	
let inherit (builtins) readFile;
in
{
  hardware.opengl.driSupport = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.enable = true;

  boot = {
    tmpOnTmpfs = true;

    # defined in graphical profile, should it be?
    # kernel.sysctl."kernel.sysrq" = 1;

  };

  # TODO does this really belong here??
  services.xrdp.enable = true;

  services.xrdp.defaultWindowManager = "emacs";

  networking.firewall.allowedTCPPorts = [ 3389 ];

  environment = {

    systemPackages = with pkgs; [
      feh
      imagemagick
      imlib2
      librsvg
      manpages
    ];
  };

  services.xbanish.enable = true;

  services.gnome3.gnome-keyring.enable = true;

  services.xserver = {
    enable = true;
    #displayManager.defaultSession = "emacs+exwm";
    xkbOptions = "ctrl:nocaps";
    windowManager.session = lib.singleton {
      name = "exwm";
      start = ''
        emacs
      '';
    };
    libinput.enable = true;
  };

}
