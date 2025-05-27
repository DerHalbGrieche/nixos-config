{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;

    userName = "Vasilis Manetas";
    userEmail = "vasilis.manetas@fh-erfurt.de";
    diff-so-fancy.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      fetch.prune = true;
    };
  };
}
