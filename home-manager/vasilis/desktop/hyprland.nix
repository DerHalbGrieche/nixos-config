{
  pkgs,
  inputs,
  config,
  ...

}: 
 let
  rofiTheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Murzchnvok/rofi-collection/refs/heads/master/material/material.rasi";
    sha256 = "2c0a0de8ace26112dff9139d44ce663bf9fa206dcf42ff18a21748d411a48d38";
  };
in{
  
  imports = [
    ./waybar.nix
    ./hyprlock.nix
  ];
  services.cliphist.enable = true;
  programs.rofi = {
    
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [ rofi-calc ];
    theme = rofiTheme;
  };
  home.packages = with pkgs; [ hyprcursor emote hyprshot hyprpolkitagent networkmanagerapplet brightnessctl wlogout wl-clipboard ];
   wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
    settings = {
      monitor = config.machineSettings.monitors;
      xwayland.force_zero_scaling = true;
      general = {
        gaps_out = 5;
      };
      decoration = {
        rounding = 5;
        dim_inactive = true;
      };
      windowrulev2 = [ "workspace 3, class:vesktop" "workspace 1, class:qutebrowserorg.qutebrowser.qutebrowser" ];
      "$mod" = "SUPER";
      "exec-once" = [ 
        "waybar" 
        "wl-clipboard" 
        "vesktop --ozone-platform=wayland" 
        "hyprctl setcursor macOS 24" 
        "systemctl --user start hyprpolkitagent"
        "qutebrowser"
        "hypridle"
        ];
      input = {
        accel_profile = config.machineSettings.accel_profile;
        "kb_layout" = "us";
        "kb_variant" = "colemak";
      };
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod&Shift, mouse:272, resizewindow"
      ];
      bind = [
        "$mod, T, exec, kitty"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, L, exec, hyprlock"
        "$mod, E, exec, nemo"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod&Shift, left, movewindow, l"
        "$mod&Shift, right, movewindow, r"
        "$mod&Shift, up, movewindow, u"
        "$mod&Shift, down, movewindow, d"
        "$mod, F11, fullscreen"
        "$mod&Shift, F, togglefloating"
        "$mod&Shift, M, exit"
        "$mod, Space, exec, rofi -show drun"
        "$mod, Q, killactive"
        "$mod, F, exec, qutebrowser"
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
