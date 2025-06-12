{
  callPackage,
  pkgs,
  ...
}: let
  mainPkg = callPackage ./default.nix {};
in
  mainPkg.overrideAttrs (oa: rec {
    nativeBuildInputs = [pkgs.pkg-config];
    buildInputs = with pkgs;
      [
        cargo
        rustc
        rustfmt
        pre-commit
        rustPackages.clippy
        alsa-lib.dev
        libudev-zero
        #NOTE Add more deps
        vulkan-loader
        xorg.libX11
        xorg.libXrandr
        xorg.libXcursor
        xorg.libXi
        libxkbcommon
        libxkbcommon.dev
        udev.dev
        pkg-config
        glfw
        vulkan-tools
        wayland
      ]
      ++ (oa.nativeBuildInputs or []);
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
  })
