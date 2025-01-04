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
  home.packages = with pkgs; [ hyprcursor emote hyprshot hyprpolkitagent networkmanagerapplet ];
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
      windowrulev2 = [ "workspace 3, class:vesktop" "workspace 1, class:firefox" ];
      "$mod" = "SUPER";
      "exec-once" = [ 
        "waybar" 
        "wl-clipboard" 
        "vesktop --ozone-platform=wayland" 
        "hyprctl setcursor macOS 24" 
        "systemctl --user start hyprpolkitagent"
        "firefox"
        "code"
        ];
      input = {
        "kb_layout" = "us";
        "kb_variant" = "colemak";
      };
      bind = [
        "$mod, T, exec, alacritty" 
        "$mod&Shift, M, exit"
        "$mod, Space, exec, rofi -show drun"
        "$mod, Q, killactive"
        "$mod, F, exec, firefox"
        "$mod, period, exec, emote"
        ", Print, exec, hyprshot -m region --clipboard-only"
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