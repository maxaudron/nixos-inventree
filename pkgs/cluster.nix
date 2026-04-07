{
  writeShellApplication,
  venv,
  inventree,
  ...
}:

writeShellApplication rec {
  name = "inventree-cluster";
  runtimeInputs = [
    venv
    inventree
  ];

  text = ''
    INVENTREE_SRC=${inventree}/src/src/backend
    pushd $INVENTREE_SRC/InvenTree
    python manage.py qcluster
    popd
  '';
}
