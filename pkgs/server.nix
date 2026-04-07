{
  writeShellApplication,
  venv,
  inventree,
  ...
}:

writeShellApplication rec {
  name = "inventree-server";
  runtimeInputs = [
    venv
    inventree
  ];

  text = ''
    INVENTREE_SRC=${inventree}/src/src/backend
    pushd $INVENTREE_SRC/InvenTree
    gunicorn -c gunicorn.conf.py InvenTree.wsgi "$@"
    popd
  '';
}
