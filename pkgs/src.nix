{
  lib,
  fetchFromGitHub,
  ...
}:

(fetchFromGitHub {
  owner = "inventree";
  repo = "InvenTree";
  rev = "1.3.0";
  hash = "sha256-I/BH50XjQDV7StDdJbxnl0Lan83BqwYrLuefKpSlAqE=";
})
