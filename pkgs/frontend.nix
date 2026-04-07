{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchYarnDeps,
  yarnConfigHook,
  yarnBuildHook,
  yarnInstallHook,
  nodejs,

  src,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "inventree-frontend";
  version = "0.7.0";

  inherit src;

  sourceRoot = "source/src/frontend";

  patchFlags = "-p3";
  patches = [
    ../patches/fix-frontend-output-dir.patch
  ];

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = finalAttrs.src + "/src/frontend/yarn.lock";
    hash = "sha256-tZHrl6NC4MGpmH7+Ge2V/y9FRNd9NdbQ/NreHE10b10=";
  };

  preBuild = ''
    yarn compile
  '';

  nativeBuildInputs = [
    yarnConfigHook
    yarnBuildHook
    yarnInstallHook
    # Needed for executing package.json scripts
    nodejs
  ];

  installPhase = ''
    mkdir -p $out/
    pushd dist
    find . -type f -exec install -Dm 755 "{}" "$out/{}" \;
    popd
  '';

  meta = {
    # ...
  };
})
