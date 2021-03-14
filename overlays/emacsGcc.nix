final: prev: {

      emacsGcc =
        let
          package = (prev.emacsGcc.override { withXwidgets = true;});
          emacsPackages = prev.emacsPackagesNgGen package;
          emacsWithPackages = emacsPackages.emacsWithPackages;
          app-launcher = emacsPackages.trivialBuild {
            pname = "app-launcher";
            src = prev.fetchurl {
              url = "https://raw.githubusercontent.com/SebastienWae/app-launcher/master/app-launcher.el";
              sha256 = "bA4d4DvBfobS+sZz6rfrYAVAX6ct8qqUO59LCghR+iQ=";
            };
          };
          gh-notify = emacsPackages.trivialBuild {
            pname = "gh-notify";
            packageRequires = [ emacsPackages.magit emacsPackages.forge ];
            src = prev.fetchurl {
              url = "https://raw.githubusercontent.com/anticomputer/gh-notify/3e2f7b8e4804e1edb1b2464cea671cedbbd95424/gh-notify.el";
              sha256 = "03ikgzc67n5jkrf231zdnrc58kpv5ibdh36phzha9fw8nm0yasl4";
            };
          };
        in emacsWithPackages (epkgs: with epkgs; [
          modus-operandi-theme
          modus-vivendi-theme
          rainbow-delimiters
          nix-mode
          app-launcher
          xwwp
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
          elfeed
          elfeed-goodies
          elfeed-org
          elfeed-dashboard
          elfeed-score
          magit
          github-review
          forge
          gh-notify
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
          evil-org
        ]);

}
