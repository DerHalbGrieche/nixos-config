{
  pkgs,
  inputs,
  ...
}: {
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
    inputs.nixvim.packages.x86_64-linux.default
  ];
}
