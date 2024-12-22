{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;  # Using VSCodium package
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      vscodevim.vim
      arrterian.nix-env-selector
      gitlab.gitlab-workflow
      mkhl.direnv
    ];
    userSettings = {
        "files.autoSave" = "onFocusChange";
        "workbench.colorTheme" = "Default High Contrast";
        "nix.enableLanguageServer" = true;
        "git.autofetch"= true;
    };
  };
}