{
  pkgs ? (let
    inherit (builtins) fetchTree fromJSON readFile;
    inherit ((fromJSON (readFile ./flake.lock)).nodes) nixpkgs;
  in
    import (fetchTree nixpkgs.locked) {}),
}:
pkgs.mkShell {
  hardeningDisable = ["all"];
  name = "simple Dev-Shell";
  buildInputs = with pkgs; [gnumake libgcc clang-tools];

  shellHook = "";
}
