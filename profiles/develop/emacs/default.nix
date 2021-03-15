{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    emacsGcc
    inconsolata
    mu
    imagemagick
  ];
}
