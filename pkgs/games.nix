{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    protonup-qt
    wineWowPackages.stagingFull
    protontricks
    wine
    wine64
    winetricks
    freetype
    runelite
    lutris
    vulkan-tools
    protonplus
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      inputs.dw-proton.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
