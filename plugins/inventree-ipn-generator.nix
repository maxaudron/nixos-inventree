{
  lib,
  stdenv,
  fetchFromGitHub,
  pyprojectHook,
  resolveBuildSystem,
  prev,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "inventree-ipn-generator";
  version = "0.1.2";
  src = (
    fetchFromGitHub {
      owner = "LavissaWoW";
      repo = "inventree-ipn-generator";
      rev = "2e745eb435e6d4ec942f502435bdcc6e2154777b";
      hash = "sha256-JPAAtEluqhwFgnHHyZidZ33Nkutow+Q+ma9H2fLn6Zw=";
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
    prev.setuptools
  ];

  # Dependencies go in passthru to avoid polluting runtime package.
  passthru = {
    #inherit (lockpkg) dependencies optional-dependencies;
  };
})
