{
  callPackage,
  rust-analyzer,
  rustfmt,
  clippy,
  lldb,
}: let
  mainPkg = callPackage ./default.nix {};
in
  mainPkg.overrideAttrs (oa: {
    nativeBuildInputs =
      [
        # Additional rust tooling
        rust-analyzer
        rustfmt
        clippy
        lldb
      ]
      ++ (oa.nativeBuildInputs or []);
  })
