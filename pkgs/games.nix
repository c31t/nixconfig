{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonup-qt
    wineWowPackages.staging

    prismlauncher

    bottles

    r2modman

    mangohud

    protontricks
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
