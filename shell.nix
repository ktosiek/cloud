{ nixpkgs ? (import <nixpkgs> {}),
  nixops ? null }:

with nixpkgs; stdenv.mkDerivation {
  name = "cloud-0.0";

  buildInputs = [ git nixops ];

  shellHook = ''
    export NIXOPS_DEPLOYMENT=vultr
  '';
}
