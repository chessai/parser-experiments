{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  parser-experiments = (
    with rec {
      parser-experimentsSource = pkgs.lib.cleanSource ../.;
      parser-experimentsBasic  = self.callCabal2nix "parser-experiments" parser-experimentsSource { };
    };
    overrideCabal parser-experimentsBasic (old: {
    })
  );
}
