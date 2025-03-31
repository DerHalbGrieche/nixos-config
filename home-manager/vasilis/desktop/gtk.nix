{
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.dconf pkgs.fira-code];
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    font = {
      name = "Fira Code";
      package = pkgs.fira-code;
      size = 10;
    };
  };
  #qt.enable = true;
  #qt.style.name = "material";
  #qt.platformTheme = "gtk2";
}
