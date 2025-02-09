{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "blade-runner";
    };
  };
}
