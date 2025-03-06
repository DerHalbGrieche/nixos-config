{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
    poetry2nix,
    ...
  }: let
    forAllSystem = nixpkgs.lib.genAttrs (import systems);
    pkgsFor = nixpkgs.legacyPackages;
  in {
    packages = forAllSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      p2nix = poetry2nix.lib.mkPoetry2Nix {inherit pkgs;};
    in {
      default = p2nix.mkPoetryApplication {
        projectDir = ./.;
        preferWheels = true;
        checkPhase = ''
          mypy
          ruff check
          pytest
        '';
      };
    });
    devShells =
      forAllSystem
      (system: {default = pkgsFor.${system}.callPackage ./shell.nix {};});
  };
}
