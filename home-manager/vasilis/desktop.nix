{
  pkgs,
  config,
  lib,
  ...
}: {
  options.machineSettings = lib.mkOption {
    #type = lib.types.attrsOf (lib.types.listOf lib.types.str);
    type = lib.types.anything;
    description = "Machine-specific settings (e.g. monitor definitions)";
  };
  config.machineSettings = {
    monitors = [
      "DP-3, 2560x1440@165, 1920x0, 1"
      "HDMI-A-1, 1920x1080@60, 0x0, 1"
    ];
    accel_profile = "flat";
  };
}
