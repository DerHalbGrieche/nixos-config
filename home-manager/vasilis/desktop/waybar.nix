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
          spacing = 5;
          modules-left = [ "custom/home" "hyprland/workspaces" "custom/bitcoin" ];
          modules-right = [ "cpu" "memory" "wireplumber" "tray" "battery" "custom/logout" ];
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
            "format" = "₿: {}$";
            "interval" = 600;
          "exec" = ''
            curl -s https://api.coindesk.com/v1/bpi/currentprice.json | \
            jq '.bpi.USD.rate' --unbuffered --compact-output | \
            tr --delete "\"" | \
            sed -E ':a;s/([0-9])([0-9]{3})(,|$)/\1.\2\3/;ta' | \
            sed -e 's/,/COMMA/g' -e 's/\./DOT/g' -e 's/COMMA/./g' -e 's/DOT/,/g'
  '';
          };

        };
      };
    };

}