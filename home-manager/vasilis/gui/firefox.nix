{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    policies = {
      BlockAboutConfig = true;
      DefaultDownloadDirectory = "\${home}/Downloads";
      BlockAboutProfiles = true;
      DisableFireefoxAccounts = true;
      DisableTelemetry = true;
      DisablePocket = true;
    };
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
      search = {
        default = "ddg";
        force = true;
        engines = {
          nix-packages = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = ["@nw"];
          };
          nueschtos = {
            name = "Nüschtos";
            urls = [{template = "https://search.nüschtos.de/?query={searchTerms}";}];
            iconMapObj."16" = "https://search.nüschtos.de/favicon.ico";
            definedAliases = ["@ns"];
          };

          bing.metaData.hidden = true;
          google.metaData.alias = "@g";
        };
      };
      settings = {
        "browser.tabs.groups.enabled" = true;
        "browser.tabs.groups.smart.enabled" = true;
        "browser.tabs.groups.smart.optin" = true;

        "sidebar.verticalTabs" = true;

        # Disable built-in password manager
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.generation.enabled" = false;
        "signon.management.page.breach-alerts.enabled" = false;
      };
    };
  };
  xdg.mimeApps.defaultApplications = let
    mimeTypes = [
      "text/html"
      "text/xml"
      "application/xhtml+xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "application/pdf"
    ];
  in
    builtins.listToAttrs (map (mime: {
        name = mime;
        value = "firefox.desktop";
      })
      mimeTypes);
  home.sessionVariables.DEFAULT_BROWSER = "firefox";
}
