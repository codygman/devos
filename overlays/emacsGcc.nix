final: prev: {

      emacsGcc =
        let
          package = prev.emacsGcc;
          emacsPackages = prev.emacsPackagesNgGen package;
          emacsWithPackages = emacsPackages.emacsWithPackages;
        in emacsWithPackages (epkgs: with epkgs; [
          modus-operandi-theme
          modus-vivendi-theme
          rainbow-delimiters
          which-key
          use-package
          evil
          evil-collection
          general
          ( selectrum.override (args: {
                          melpaBuild = drv: args.melpaBuild (drv // {
                            src = final.pkgs.fetchFromGitHub {
                              owner = "raxod502";
                              repo = "selectrum";
                              rev = "af5d027681d18d10559c2cddefe57c5577bbd611";
                              sha256 = "1hivf7avyn8dhsrqc695bpfmy4nc5bgm7cw37r423sgr9236j4l5";
                            };
                          });
                        }) )
          orderless
          selectrum-prescient
          projectile
          consult-flycheck
          ( consult.override (args: {
                melpaBuild = drv: args.melpaBuild (drv // {
                  src = final.pkgs.fetchFromGitHub {
                    owner = "minad";
                    repo = "consult";
                    rev = "4b7830f620e93f74608abb537229f2034d95a40a";
                    sha256 = "GndF7byORkiJdck1p2eblRo/XS9DT0/NZL1sBI/+Ikw=";
                  };
                });
              }) )
          ( marginalia.override (args: {
                melpaBuild = drv: args.melpaBuild (drv // {
                  src = final.pkgs.fetchFromGitHub {
                    owner = "minad";
                    repo = "marginalia";
                    rev = "c5e89cf4220196205f6d6ce21f5cef87d186c1b4";
                    sha256 = "0q700f4apxrygz9c25grih7mji2bshnskjsn16gyi7b4wdsyqvnm";
                  };
                });
              }) )
          magit
          esh-autosuggest
          fish-completion
          ( keyfreq.override (args: {
              melpaBuild = drv: args.melpaBuild (drv // {
                src = final.pkgs.fetchFromGitHub {
                  owner = "dacap";
                  repo = "keyfreq";
                  rev = "e5fe9d585ce882f1ba9afa5d894eaa82c79be4f4";
                  sha256 = "12m1jy8m8i39b809qbxx9g3r066jxhqwfyf5mqbd1lzlaw63b1i7";
                };
              });
            }) )
          direnv
          olivetti
          org-roam
          haskell-mode
          lsp-mode
          lsp-haskell
          lsp-ui
          #company
          exwm
          exwm-edit
        ]);

}
