{
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.dconf pkgs.fira-code pkgs.xdg-desktop-portal-gtk];
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # Configure XDG portal for GTK file picker
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = ["gtk"];
      };
      hyprland = {
        default = ["gtk"];
        "org.freedesktop.impl.portal.Screenshot" = ["hyprland"];
        "org.freedesktop.impl.portal.ScreenCast" = ["hyprland"];
      };
    };
  };

  systemd.user.services.xdg-desktop-portal-gtk = {
    Unit = {
      Description = "Portal service (GTK/GNOME implementation)";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Environment = "GTK_USE_PORTAL=1";
      ExecStart = "${pkgs.xdg-desktop-portal-gtk}/libexec/xdg-desktop-portal-gtk";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
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
  };
  #qt.enable = true;
  #qt.style.name = "material";
  #qt.platformTheme = "gtk2";
}
