{

    description = "flake and homemanager and nixos from scrtach";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        solaar = {
          url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz"; 
        };
    };

    outputs = { self, nixpkgs, home-manager, solaar, ...}: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           modules = [
               ./configuration.nix
               home-manager.nixosModules.home-manager
               solaar.nixosModules.default
               {
                   home-manager = {
                       useGlobalPkgs = true;
                       useUserPackages = true;
                       users.denshi = import ./home.nix;
                       backupFileExtension = "backup";
                   }; 
               }
           ];
        };
    };
}
