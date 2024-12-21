{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
  
  userName = "Vasilis Manetas";
  userEmail = "vasilis12.manetas@gmail.com";
  extraConfig = {init.defaultBranch = "main";};
  };
}