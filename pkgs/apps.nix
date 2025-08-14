{pkgs, ...}: {
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vlc
    libreoffice
    dualsensectl
    rivalcfg
    eyedropper
    obs-studio
    lutris
    headsetcontrol
    vulkan-tools
    vulkan-loader
    vdhcoapp
    spotify
  ];
}
