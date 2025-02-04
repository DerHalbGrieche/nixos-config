{
  pkgs,
  ...
}: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors.webpage.darkmode.enabled = true;
    };
    searchEngines = {
      np = "https://search.nixos.org/packages?query={}&channel=unstable";
    };
    keyBindings = {
      normal = {
        "e" = ''spawn --userscript qute-pass '';
        "E" = ''spawn --userscript qute-pass --password-only'';
      };
    };
  };
}