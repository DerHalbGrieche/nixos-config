{
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    themeFile = "MaterialDark";
    font = {
      name = "Fira Code";
      package = pkgs.fira-code;
    };
    settings = {
      background_opacity = "0.5";
    };
  };
}
