{pkgs, ...}: {
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vlc
    libreoffice
    eyedropper
    obs-studio
    vulkan-tools
    vulkan-loader
    vdhcoapp
    ani-cli
    fastfetch
  ];
}
