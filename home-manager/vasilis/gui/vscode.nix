{pkgs, ...}: {
  home.packages = with pkgs; [gcc];
  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;  # Using VSCodium package
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      vscodevim.vim
      arrterian.nix-env-selector
      gitlab.gitlab-workflow
      mkhl.direnv
      github.copilot
      github.copilot-chat
      ms-vscode.cpptools-extension-pack
      tomoki1207.pdf
    ];
    userSettings = {
      "files.autoSave" = "onFocusChange";
      "workbench.colorTheme" = "Default High Contrast";
      "nix.enableLanguageServer" = true;
      "git.autofetch" = true;
      "editor.fontFamily" = "'Fira Code'";
      "editor.fontLigatures" = true;
    };
  };
}
