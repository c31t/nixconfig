# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
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
    };
  };
  networking.networkmanager.enable = true;

  # Set your time zone.
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.libinput.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "celt";

  environment.systemPackages = with pkgs; [
    wget
    git
    sof-firmware
    pciutils
    usbutils
  ];

  environment.pathsToLink = [
    "/bin"
    "/lib"
    "/lib64"
    "/etx/xdg"
    "/sbin"
    "/share/applications"
    "/share/emacs"
    "/share/hunspell"
    "/share/nano"
    "/share/org"
    "/share/themes"
    "/share/vim-plugins"
    "/share/vulkan"
    "/share/kservices5"
    "/share/kservicetypes5"
    "/share/kxmlgui5"
    "/share/systemd"
    "/share/thumbnailers"
    "/share/xdg-desktop-portal"
    "/share/qemu"
    "/sys"
  ];

  # kdeconnect
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
  services.protonmail-bridge.enable = true;
  boot.tmp.useTmpfs = true;
  boot.tmp.cleanOnBoot = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5d";
  };

  nix.settings.auto-optimise-store = true;

  security.polkit.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
