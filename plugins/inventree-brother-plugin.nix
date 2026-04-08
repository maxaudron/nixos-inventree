{
  lib,
  stdenv,
  fetchFromGitHub,
  pyprojectHook,
  resolveBuildSystem,
  final,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "inventree-brother-plugin";
  version = "2.0.5";
  src = (
    fetchFromGitHub {
      owner = "inventree";
      repo = "inventree-brother-plugin";
      rev = finalAttrs.version;
      hash = "sha256-rx2HcxvBcI88GZWIuXEB39LY+RtmUopU/5+sZkNe+lc=";
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
      brother-ql-inventree = [ ];
    };
  };
})
