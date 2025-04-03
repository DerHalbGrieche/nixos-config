{pkgs, ...}: {
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
}
