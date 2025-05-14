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
  boot.plymouth.enable = true;
  boot.loader.grub = {
    timeoutStyle = "hidden";
  };
}
