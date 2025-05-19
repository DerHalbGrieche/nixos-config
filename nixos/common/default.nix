{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [./greetd.nix];
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = " set -g fish_greeting ";
  };
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;
  networking.hosts = {
    "127.0.0.1" = ["lolcathost"];
  };
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    gamescopeSession.enable = true;
    localNetworkGameTransfers.openFirewall = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
  };
  environment.systemPackages = [
    pkgs.neovim
  ];
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
  };
  boot = {
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "plymouth.use-simpledrm"
    ];
    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = ["lone"];
        })
      ];
    };
    loader = {
      timeout = 0;
      grub = {
        timeoutStyle = "hidden";
        backgroundColor = null;
        # gfxpayloadEfi = "text";
        splashImage = null;
      };
    };
  };
  systemd.services.plymouth-quit = {
    serviceConfig.ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";
  };
}
