{
  pkgs,
  config,
  ...
}: {
  programs.password-store = {
    enable = true;
    settings = {PASSWORD_STORE_DIR = "$HOME/.password-store";};
    packages = pkgs.pass.withExtensions (p: [p.pass-otp]);
  };

  services.pass-secret-service = {
    enable = true;
    storePath = "${config.home.homeDirectory}/.password-store";
    extraArgs = "${config.programs.password-store.package}/bin/pass";
  };
}