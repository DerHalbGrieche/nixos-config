{
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
    helix-gpt
    ];
    defaultEditor = true;
    settings = {
      theme = "base16_transparent";
      editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
      };
      editor = {
        line-number = "relative";
        mouse = false;
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
    };
    languages = {
      language = [{
        name = "nix";
        language-servers = ["nixd"];
        roots = ["flake.nix"];
      }];
    };
  };
}
