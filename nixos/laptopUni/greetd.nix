{
  pkgs,
  lib,
  ...
}: let
  hyprlandConfig = pkgs.writeText "greetd-hyprlandConfig" ''
      exec-once = ${pkgs.greetd.regreet}/bin/regreet; ${pkgs.hyprland}/bin/hyprctl dispatch exit
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
    settings = rec {
        #command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
      #};
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland --config ${hyprlandConfig}";
        user = "vasilis";
        };
      default_session = initial_session;
    };
  };
  environment.etc."greetd/enviroments".text = ''
  ${pkgs.hyprland}/bin/Hyprland
  ${pkgs.fish}/bin/fish
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