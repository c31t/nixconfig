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
  security.sudo.wheelNeedsPassword = false;

  boot.loader.systemd-boot.enable = false;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;

      minegrub-world-sel = {
        enable = true;
        customIcons = [];
      };
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
      };
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [vulkan-tools];
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    videoAcceleration = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    dataDir = "/var/lib/mariadb";
  };
  services.lsfg-vk = {
    enable = true;
    ui.enable = true;
  };
  services.solaar = {
    enable = true;
    package = pkgs.solaar;
    window = "hide";
    batteryIcons = "regular";
    extraArgs = "";
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
