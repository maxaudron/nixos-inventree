{
  writeShellApplication,
  venv,
  inventree,
  poppler-utils,
  ...
}:

writeShellApplication rec {
  name = "inventree-cluster";
  runtimeInputs = [
    venv
    inventree
    poppler-utils
  ];

  text = ''
    INVENTREE_SRC=${inventree}/src/src/backend
    pushd $INVENTREE_SRC/InvenTree
    python manage.py qcluster
    popd
  '';
}
