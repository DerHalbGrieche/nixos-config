{
  pkgs,
  ...
}: {
  services.podman = {
    enable = true;
    containers = {
      ollama = {
        image = "ollama/ollama";
        extraPodmanArgs = [
          "-d"
          "-p 11434:11434"
        ];
      };
      deepseek = {
        image = "ghcr.io/open-webui/open-webui:main";
        extraPodmanArgs = [
          "-d"
          "-p 3000:8080"
          "--network=host"
        ];
        environment = {
          WEBUI_AUTH = false;
        };
      };
    };
  };
}
