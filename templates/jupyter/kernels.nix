{
  kernel = {
    # Python 3 minimal kernel
    python.minimal = {
      enable = true;
      displayName = "Python 3 minimal";
    };
    # Data science kernel
    python.science = {
      enable = true;
      extraPackages = ps: [ps.numpy ps.scipy ps.matplotlib];
      displayName = "Python 3 data science";
    };
    # Jupyter Golang kernel
    go.minimal = {
      enable = true;
      displayName = "Golang minimal";
    };
  };
}
