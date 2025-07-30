{pkgs, ...}:
{
	environment.systemPackages = with pkgs.kdePackages; [
	    kde-gtk-config
	    kate
	    kdenlive
	    konsole
	    ktorrent
	    pkgs.plasma-overdose-kde-theme
	];

	programs.kdeconnect.enable = true;
}
