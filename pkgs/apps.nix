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
    unzip
    vulkan-tools
    vulkan-loader
    vdhcoapp
    spotify
    nur.repos.nltch.spotify-adblock
    nur.repos.nltch.ciscoPacketTracer8
  ];
}
