{pkgs, ...}: {
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

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
    nur.repos.nltch.spotify-adblock
    nur.repos.nltch.ciscoPacketTracer8
  ];
}
