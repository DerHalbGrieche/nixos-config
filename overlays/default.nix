{
  outputs,
  inputs,
  ...
}: {
  neovim = _: prev: {
    neovim = inputs.nixvim.packages.${prev.system}.default;
  };
  nur = _: prev: {
    nur = inputs.nur.legacyPackages.${prev.system};
  };
}
