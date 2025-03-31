{pkgs, ...}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      helix-gpt
      nixd
      alejandra
      nil
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
      language-server.copilot = {
        command = "helix-gpt";
      };
      language = [
{
          name = "nix";
          auto-format = true;
          roots = ["flake.nix"];
          formatter = {
            command = "alejandra";
          };
        }      {
        name = "rust";
        language-servers = [ "rust-analyzer" "copilot" ];
      }];
    };
  };
}
