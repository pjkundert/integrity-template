let
  holonixPath = builtins.fetchTarball "https://github.com/holochain/holonix/archive/3e8ca8b9047dc326b9ac2bcf18909038c5f54128.tar.gz";
  holonix = import (holonixPath) {
    holochainVersionId = "custom";
    holochainVersion = import ./holochain_version.nix;
  };
  nixpkgs = holonix.pkgs;
in nixpkgs.mkShell {
  inputsFrom = [ holonix.main ];
  packages = [
    nixpkgs.binaryen
  ];
}
