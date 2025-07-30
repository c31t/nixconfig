{...}: {
	services.flatpak = {
	    enable = true;
	    update.auto.enable = true;
	    uninstallUnmanaged = true;

	    packages = []; # anything you want from flathub here
	};
}
