{
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    #openDefaultPorts = true;
    settings = {
      devices = {
        "phone" = { id = "O3OCYBN-V47ZTWG-PD637HW-3Y5CJX6-6XL7PP3-SZQR6KK-Q4U4POA-Q5VHMAX";};
      };
      folders = {
        "Passwords" = {
          path = "/home/vasilis/.password-store";
          devices = [ "phone" ];
        };
      };
    };
  };
}