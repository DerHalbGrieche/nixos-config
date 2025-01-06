{
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    #package = pkgs.greetd.gtkgreet;
    settings = {
      terminal.vt = 7;
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
      };
    };
  };
}