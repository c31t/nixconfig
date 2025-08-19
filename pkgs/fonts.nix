{pkgs, ...}: let
  rainyhearts = pkgs.callPackage ./custom/rainyhearts.nix {};
in {
  environment.systemPackages = with pkgs; [
    rainyhearts
  ];
}
