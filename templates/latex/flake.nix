{
  description = "Latex Template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: {
    devShells.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [texlab texliveFull];
      };
    };
  };
}
