{
  pkgs,
  inputs,
  ...
}: {
  users.users.celt = {
    isNormalUser = true;
    description = "celt";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "audio" "libvirtd" "jackaudio" "kvm" "scanner" "lp" "cdrom"];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
