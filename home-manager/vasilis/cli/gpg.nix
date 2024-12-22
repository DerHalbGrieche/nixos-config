{
  pkgs,
  config,
  lib,
  ...
}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentryPackage =
      if config.gtk.enable
      then pkgs.pinentry-gnome3
      else pkgs.pinentry-tty;
  };

  home.packages = lib.optional config.gtk.enable pkgs.gcr;

  programs = let
    fixGpg =
      #bash
      ''
        gpgconf --launch gpg-agent
      '';
  in {
    # start gpg-agent if its not running or tunneled in
    # SSH does not start it automatically, so we need to avoid having to use a gpg command on system
    # startup to start it
    # https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
    bash.profileExtra = fixGpg;
    fish.loginShellInit = fixGpg;
    zsh.loginExtra = fixGpg;
    # Use TOFU+PGP trust model
    gpg = {
      enable = true;
      settings = {
        trust-model = "tofu+pgp";
      };
      scdaemonSettings = {
        reader-port = "Yubico Yubi";
        disable-ccid = false;
      };
    };
  };

  # Link /run/user/$UID/gnupg to ~/.gnupg-sockets
  # So that SSH config does not have to know the UID
  systemd.user.services = {
    link-gnupg-sockets = {
      Unit = {
        Description = "link gnupg sockets from /run to /home";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.coreutils}/bin/ln -Tfs /run/user/%U/gnupg %h/.gnupg-sockets";
        ExecStop = "${pkgs.coreutils}/bin/rm $HOME/.gnupg-sockets";
        RemainAfterExit = true;
      };
      Install.WantedBy = ["default.target"];
    };
  };
}