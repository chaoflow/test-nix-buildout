with import <nixpkgs> {};

let
    python = python27;
    pythonPackages = python27Packages;

in

buildPythonPackage rec {
  name = "dev-env";
  src = ./.;
  buildInputs =
    [ python
      pythonPackages.pycrypto
      pythonPackages.virtualenv
    ] ++ (lib.attrValues python.modules);
  shellHook = "";
}
