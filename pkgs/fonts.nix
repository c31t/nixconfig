{pkgs, ...}: let
  rainyhearts = pkgs.callPackage ./custom/rainyhearts.nix {};
in {
  environment.systemPackages = with pkgs; [
    rainyhearts
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];
}
