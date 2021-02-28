{ pkgs, ... }: {

  imports = [ ./haskell ./emacs ];

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
    docker-compose
    dbeaver
    robo3t
    firefox
    file
    gnupg
    less
    ncdu
    wget
    vim
    kitty
  ];

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
