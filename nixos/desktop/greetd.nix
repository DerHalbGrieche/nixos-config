{
  pkgs,
  lib,
  ...
}: let
  hyprlandConfig = pkgs.writeText "greetd-hyprlandConfig" ''
      exec-once = regreet; hyprctl dispatch exit
      monitor = DP-3, 2560x1440@165, 0x0, 1
misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    disable_hyprland_qtutils_check = true
  }
input {
  kb_layout = us
  kb_variant = colemak
}
  '';
 in {
   
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "Hyprland";
        user = "vasilis";
      };
     };
  };
  programs.regreet = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS";
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
    cageArgs = [ "-s" "-m" "last" ]
    ;
  };
  environment.etc."greetd/enviroments".text = ''
  Hyprland
  '';

  #programs.regreet = {
  #  enable = true;
  #  iconTheme = {
  #    name = "Papirus-Dark";
  #    package = pkgs.papirus-icon-theme;
  #  };
  #  cursorTheme = {
  #    package = pkgs.apple-cursor;
  #    name = "macOS";
  #  };
  #  theme = {
  #    name = "Materia-dark";
  #    package = pkgs.materia-theme;
  #  };
  #  font = {
  #    name = "Fira Code";
  #    package = pkgs.fira-code;
  #    size = 10;
  #  };
  #};
}
