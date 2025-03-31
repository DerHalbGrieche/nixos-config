{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = {
      name = "gtk3";
      package = [
        pkgs.libsForQt5.qtstyleplugins
        (pkgs.qt6.qtbase.override {
          withGtk3 = true;
          cups = pkgs.cups;
          qttranslations = null;
        })
      ];
    };
  };
}
