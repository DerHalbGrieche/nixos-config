{pkgs, ...}: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors.webpage.darkmode.enabled = true;
      content.blocking.enabled = true;
    };
    searchEngines = {
      np = "https://search.nixos.org/packages?query={}&channel=unstable";
      mn = "https://mynixos.com/search?q={}";
      nw = "https://wiki.nixos.org/w/index.php?search={}&title=Special%3ASearch&wprov=acrw1_-1";
    };
    keyBindings = {
      normal = {
        "e" = ''spawn --userscript qute-pass '';
        "E" = ''spawn --userscript qute-pass --password-only'';
      };
    };
  };
  xdg.mimeApps.defaultApplications = {
    "text/html" = "org.qutebrowser.qutebrowser.desktop";
    "text/xml" = "org.qutebrowser.qutebrowser.desktop";
    "application/xhtml+xml" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
  };
  environment.sessionVariables.DEFAULT_BROWSER = "qutebrowser";
}
