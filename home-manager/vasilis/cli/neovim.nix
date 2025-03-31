{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      gruvbox-material-nvim
    ];
    extraPackages = with pkgs; [
    ];
    extraConfig = ''
      set number relativenumber
    '';
    extraLuaConfig = ''
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

      -- empty setup using defaults
      require("nvim-tree").setup()


      vim.o.termguicolors  = true
      vim.cmd('colorscheme gruvbox-material')
      vim.g.gruvbox_material_background = 'hard'
    '';
    coc = {
      enable = true;
      settings = {
        languageserver = {
          nix = {
            command = "nil";
            filetypes = ["nix"];
            rootPatterns = ["flake.nix"];
          };
        };
      };
    };
  };
}
