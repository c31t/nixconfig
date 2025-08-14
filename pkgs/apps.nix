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
    pkgs.nur.repos.nltch.spotify-adblock
    pkgs.nur.repos.nltch.ciscoPacketTracer8
  ];
}
