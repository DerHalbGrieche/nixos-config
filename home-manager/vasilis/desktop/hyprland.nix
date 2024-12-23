{
  pkgs,
  inputs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "cpu" "memory" "tray" "battery" ];

        "backlight/slider" = {
          min = 10;
          
        };
      };
    };
  };
  programs.wofi.enable = true;
  services.cliphist.enable = true;
   wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings = {
      monitor = "laptopScreen, 1920x1080, 0x0, 1";
      xwayland.force_zero_scaling = true;
      general = {
        gaps_out = 5;
      };
      decoration = {
        rounding = 5;
      };
      windowrulev2 = [ "workspace 3, class:vesktop" ];
      "$mod" = "SUPER";
      "exec-once" = "waybar & wl-clipboard & vesktop";
      input = {
        "kb_layout" = "us";
        "kb_variant" = "colemak";
      };
      bind = [
        "$mod, T, exec, alacritty" 
        "$mod&Shift, M, exit"
        "$mod, Space, exec, wofi --show drun"
        "$mod, Q, killactive"
        "$mod, F, exec, firefox"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
            let ws = i +1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
        );
      # "bind" = "$mod, SHIFT, M, exit";
    };
          };
    
}