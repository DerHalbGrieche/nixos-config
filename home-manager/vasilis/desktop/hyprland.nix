{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./waybar.nix
    ./hyprlock.nix
  ];
  services.cliphist.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "material";
  };
  home.packages = with pkgs; [ hyprcursor emote hyprshot hyprpolkitagent networkmanagerapplet brightnessctl wlogout wl-clipboard ];
   wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
    settings = {
      monitor = "eDP-1, 1920x1080, 0x0, 1.25";
      xwayland.force_zero_scaling = true;
      general = {
        gaps_out = 5;
      };
      decoration = {
        rounding = 5;
      };
      windowrulev2 = [ "workspace 3, class:vesktop" "workspace 1, class:firefox" ];
      "$mod" = "SUPER";
      "exec-once" = [ 
        "waybar" 
        "wl-clipboard" 
        "vesktop --ozone-platform=wayland" 
        "hyprctl setcursor macOS 24" 
        "systemctl --user start hyprpolkitagent"
        "firefox"
        "hypridle"
        ];
      input = {
        "kb_layout" = "us";
        "kb_variant" = "colemak";
      };
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod&Shift, mouse:272, resizewindow"
      ];
      bind = [
        "$mod, T, exec, alacritty"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, L, exec, hyprlock"
        "$mod, E, exec, nemo"
        "$mod&Shift, M, exit"
        "$mod, Space, exec, rofi -show drun"
        "$mod, Q, killactive"
        "$mod, F, exec, firefox"
        "$mod, period, exec, emote"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", Print, exec, hyprshot -m region --clipboard-only"
        ", XF86PowerOff, exec, wlogout"
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
    };
          };
    
}
