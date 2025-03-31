{pkgs, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = false;
      };
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      input-field = [
        {
          font-family = "Fira Code";
          size = "200, 50";
          position = "0, -80";
          monitor = "";
        }
      ];
    };
  };
}
