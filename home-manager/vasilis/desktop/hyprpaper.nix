{pkgs, ...}: let
  wallpaper = builtins.fetchurl {
    url = "https://i.redd.it/r49ipi5k8ita1.jpg";
    sha256 = "19a5c8b4f27f2cd229bfcd7c5a1b34e410267ea893c14e4021b6659938cd68ec";
  };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      preload = [wallpaper];

      wallpaper = [
        ", ${wallpaper}"
      ];
    };
  };
}
