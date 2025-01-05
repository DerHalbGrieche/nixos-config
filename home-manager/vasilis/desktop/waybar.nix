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
          "hyprland/workspaces" = {
            "format" = "{id}: {windows}";
            "window-rewrite" = {
              "class<vesktop>" = "";
              "class<code>" = "";
              "class<firefox>" = "";
              "class<alacritty>" = "";
              "class<nemo>" = "";
            };
          };
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