{
  pkgs,
  callPackage,
  ...
}: let
  mainPkg = callPackage ./default.nix {};
in
  mainPkg.overrideAttrs (oa: {
    nativeBuildInputs = with pkgs;
      [
        texlab
        texliveFull
      ]
      ++ (oa.nativeBuildInputs or []);
  })
