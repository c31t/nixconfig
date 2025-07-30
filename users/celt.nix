{
  pkgs,
  inputs,
  ...
}: {
  users.users.celt = {
    isNormalUser = true;
    description = "celt";
    extraGroups = ["networkmanager" "wheel" "audio" "libvirtd" "jackaudio" "kvm" "scanner" "lp" "cdrom"];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
