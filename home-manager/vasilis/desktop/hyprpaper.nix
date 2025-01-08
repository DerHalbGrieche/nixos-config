{
  pkgs,
  ...
}: let
  wallpaper = builtins.fetchurl {
    url = "https://i.redd.it/fq96x9ch7x7d1.png";
    sha256 = "463837061aa81a35b8bb62b6bb9280ca4afbd33e2aa3a5d6ea86aa294bddc6c4";
  };
in{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      preload = [ wallpaper ];

      wallpaper = [
        ", ${wallpaper}"
      ];
    };
  };
}