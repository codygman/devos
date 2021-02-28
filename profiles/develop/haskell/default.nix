{ pkgs, ... }:
let
  inherit (pkgs) ghc;
in
{
  environment.systemPackages = [
    (ghc.withHoogle
      (self: with self; [
        cabal2nix
        cabal-install
        implicit-hie
        hie-bios
        haskell-language-server # caused segfault?
        stack
      ])
    )
  ];
}
