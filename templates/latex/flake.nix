{
  description = "Latex Template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    # This is the default package that builds the PDF.
    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
      pname = "latex-document";
      version = "1.0";
      src = ./.;
      buildInputs = [pkgs.texliveFull];
      buildPhase = ''
        pdflatex main.tex
        pdflatex main.tex
      '';
      installPhase = ''
        mkdir -p $out
        cp main.pdf $out/
      '';
    };

    # Dev shell for editing with tools like texlab.
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [texlab texliveFull tex-fmt];
    };
  };
}
