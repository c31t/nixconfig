# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  networking.hostName = "steamhappy"; # Define your hostname.
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 16 * 1024;
    }
  ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    videoAcceleration = true;
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
