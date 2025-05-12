{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles."vasilis" = {
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          browserpass
          darkreader
          vimium
        ];
      };
    };
  };
  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox.desktop";
    "text/xml" = "firefox.desktop";
    "application/xhtml+xml" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };
  home.sessionVariables.DEFAULT_BROWSER = "firefox";
}
