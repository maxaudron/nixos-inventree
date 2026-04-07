{
  writeShellApplication,
  venv,
  inventree,
  ...
}:

writeShellApplication rec {
  name = "inventree-python";
  runtimeInputs = [
    venv
    inventree
  ];

  text = ''
    INVENTREE_SRC=${inventree}/src/src/backend
    pushd "$INVENTREE_SRC/''${INVENTREE_PYTHON_CWD:-}"
    python "$@"
    popd
  '';
}
