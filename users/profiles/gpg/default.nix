{pkgs, ...}:
{

  home.packages = with pkgs; [ pinentry ];
  programs.gpg.enable = true;
  services.gpg-agent = {
      enable = true;
      enableScDaemon = false; # fixes something maybe?
      enableSshSupport = true;
      pinentryFlavor = "gtk2";
      extraConfig = ''
allow-emacs-pinentry
allow-loopback-pinentry
'';
  };
}
