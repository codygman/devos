{ pkgs, ... }: {

  imports = [ ./haskell ./emacs ];

  security.pam.loginLimits = [{
    domain = "*";
    type = "soft";
    item = "nofile";
    value = "99999"; # is this high a good idea?
  }];

  environment.shellAliases = { v = "$EDITOR"; };

  environment.sessionVariables = {
    PAGER = "less";
    EDITOR = "emacs";
    VISUAL = "emacs";
  };

  networking.extraHosts = ''
    127.0.0.1 api.itpro.test
  '';

  environment.systemPackages = with pkgs; [
    # work
    docker-compose
    dbeaver
    robo3t
    sqlite # for org-roam, so for work/personal really
    teams # should go somewhere else? work.im maybe?
    zoom-us

    firefox
    file
    gnupg
    less
    ncdu
    wget
    vim
    kitty
  ];

  services.spotifyd.enable = true;

  fonts = {
    # fonts = [ pkgs.dejavu_nerdfont ];
    # fontconfig.defaultFonts.monospace =
    #  [ "DejaVu Sans Mono Nerd Font Complete Mono" ];
  };

  documentation.dev.enable = true;

  programs.thefuck.enable = true;
  programs.firejail.enable = true;
  programs.mtr.enable = true;

  virtualisation = {
    docker.enable = true;
  };

}
