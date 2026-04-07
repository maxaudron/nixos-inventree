{
  writeShellApplication,
  writeScript,
  yarn,
  bash,
  venv,
  inventree,
  ...
}:

writeShellApplication rec {
  name = "inventree-invoke";
  runtimeInputs = [
    yarn
    venv
    inventree
    bash
  ];

  text = ''
    INVENTREE_SRC=${inventree}/src
    pushd $INVENTREE_SRC > /dev/null 2>&1
    invoke "$@"
    popd > /dev/null 2>&1
  '';
}
