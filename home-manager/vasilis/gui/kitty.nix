{
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    themeFile = "cyberpunk";
    font = {
      name = "Fira Code";
      package = pkgs.fira-code;
    };
    settings = {
      background_opacity = "0.75";
    };
  };
}
