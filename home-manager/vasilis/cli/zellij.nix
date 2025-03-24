{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "blade-runner";
       show_startup_tips = false;
    };
  };
}
