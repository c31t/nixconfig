{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonup-qt
    wineWowPackages.stagingFull
    protontricks
    wine
    wine64
    winetricks
    freetype
    runelite
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
