{
  lib,
  stdenv,
  fetchFromGitHub,
  pyprojectHook,
  resolveBuildSystem,
  final,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "brother-ql-inventree";
  version = "1.4a1";
  src = (
    fetchFromGitHub {
      owner = "matmair";
      repo = "brother_ql-inventree/";
      rev = "5364d30e0ad088fa943642a05863814390d52b4f";
      hash = "sha256-wSekzrpiOeyT51Wlf7haLpPhbY6/PWtZljG88ihrMKo=";
    }
  );
  nativeBuildInputs = [
    # Add hook responsible for configuring, building & installing.
    pyprojectHook
  ]
  # Build systems needs to be resolved since we don't propagate dependencies.
  # Otherwise dependencies of our build-system will be missing.
  ++ resolveBuildSystem { flit-core = [ ]; };

  buildInputs = [
    final.setuptools
  ];

  # Dependencies go in passthru to avoid polluting runtime package.
  passthru = {
    dependencies = {
      click = [ ];
      packbits = [ ];
      pillow = [ ];
      pyusb = [ ];
      attrs = [ ];
    };
  };
})
