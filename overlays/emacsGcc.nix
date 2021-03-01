final: prev: {

      emacsGcc =
	let
	  memacs = prev.emacsGcc;
	  myEmacsWithPackages =
	  (prev.emacsPackagesNgGen memacs).emacsWithPackages;
	in myEmacsWithPackages (e: with e; [
	  use-package
      ]);

}
