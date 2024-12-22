{
  pkgs,
  ...
}: {
  programs.vscode = {
    programs.vscode.enable = true;
    programs.vscode.package = pkgs.vscodium;

  };

 }