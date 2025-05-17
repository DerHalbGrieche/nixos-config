{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    style = ./waybar.css;
    settings = {
      primary = {
        layer = "top";
        margin = "1";
        spacing = 1;
        modules-left = ["custom/home" "hyprland/workspaces"];
        modules-right = ["group/expand" "custom/logout"];
        modules-center = ["clock"];

        #Module Config

        "clock" = {
          "interval" = 1;
          "tooltip" = false;
          "format" = "{:%H:%M:%S}";
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
        "wireplumber" = {
          "format" = "🔊{volume}%";
          "on-click" = "pavucontrol";
        };
        "custom/home" = {
          "format" = "🌸";
          #"exec-on-click" = true;
          "on-click" = "rofi -show drun";
        };
        "custom/logout" = {
          "format" = "🚪";
          "on-click" = "wlogout";
        };
        "custom/bitcoin" = {
          #"return-type" = "json";
          "format" = "₿: {}€";
          "interval" = 600;
          "exec" = "curl -s 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,zcash,litecoin&vs_currencies=eur' | jq .bitcoin.eur";
        };
        "custom/notifications" = {
          "format" = "🔔";
          "on-click" = "swaync-client -op";
        };
        "group/expand" = {
          "orientation" = "horizontal";
          "drawer" = {
            "transition-duration" = 600;
            "transition-to-left" = true;
            "click-to-reveal" = true;
          };
          "modules" = ["custom/expand" "cpu" "memory" "wireplumber" "custom/notifications" "tray" "battery"];
        };
        "custom/expand" = {
          "tooltip" = false;
          "format" = "🗄️";
        };
      };
    };
  };
}
