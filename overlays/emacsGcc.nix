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
                              rev = "38279bb74b41f235c37640f079ffdaf8332166e";
                              sha256 = "oqWGw8gaqfge7j8iNySHfPat6nKCOXo+q2dWXIsZ0Pg=";
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
                    rev = "f2bf17847dfb19852b0c4499e72ea29570b578bb";
                    sha256 = "+62VWTTP48n7Tjv4Sr9pr/+guQTcisUkzJb64BhzOaQ=";
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
