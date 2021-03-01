{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    emacsGcc
    inconsolata
    imagemagick
  ];
}
