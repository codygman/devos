final: prev: {

  emacsGcc = (prev.emacsPackagesNgGen prev.emacsGcc).emacsWithPackages (epkgs: with epkgs; [
     use-package
     exwm
   ]);

}
