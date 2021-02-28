{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    emacs
    inconsolata
    imagemagick
  ];
}
