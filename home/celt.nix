{pkgs, ...}:
{
   imports = [
   ./common.nix
   ./pkgs
   ];

	services.home-manager.autoExpire = {
		enable = true;
		frequency = "weekly";
		timestamp = "-7 days";
	};

	programs.git = {
		enable = true;
		userEmail = ""; 
		userName = "";
	};

	home = {
		stateVersion = "25.05";
	};
}
