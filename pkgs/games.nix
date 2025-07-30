{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonup-qt
    wineWowPackages.staging

    prismlauncher

    bottles

    r2modman

    mangohud

    protontricks

    wine
    wine64
    winetricks
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
