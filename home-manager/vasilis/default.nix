{...}: {
  imports = [
    ./cli/git.nix
    ./cli/pass.nix
    ./cli/gpg.nix
    ./cli/nix-index.nix
    #./cli/podman.nix
    #./cli/neovim.nix
    ./cli/helix.nix
    ./cli/zellij.nix
    ./gui/firefox.nix
    ./gui/vscode.nix
    ./gui/kitty.nix
    ./desktop/hyprland.nix
    ./desktop/hyprpaper.nix
    ./desktop/hypridle.nix
    ./desktop/gtk.nix
    ./desktop/qutebrowser.nix
    ./desktop/syncthing.nix
    ./gui/alacritty.nix
  ];
}
