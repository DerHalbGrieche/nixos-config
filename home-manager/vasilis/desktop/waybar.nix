{
  pkgs,
  ...
}: {
  programs.waybar = {
      enable = true;
      style = ./waybar.css;
      settings = {
        primary = {
          layer = "top";
          margin = "5";
          modules-left = [ "custom/home" "hyprland/workspaces" ];
          modules-right = [ "cpu" "memory" "tray" "battery" ];
          modules-center = [ "clock" ];
          
          #Module Config
          "battery" = {
            "format" = "🔋{capacity}%";
          };
          "cpu" = {
            "format" = "🧮{usage}%";
          };
          "memory" = {
            "format" = "📝{percentage}%";
          };
          "custom/home" = {
            "format" = "🌸";
            #"exec-on-click" = true;
            "on-click" = "rofi -show drun";
          };

        };
      };
    };

}