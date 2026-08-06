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
        curd = {
          url = "github:wraient/curd";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, solaar, curd, ...}: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           specialArgs = {
             inherit curd;
           };
           modules = [
               ./configuration.nix
               home-manager.nixosModules.home-manager
               {
                   home-manager = {
                       useGlobalPkgs = true;
                       useUserPackages = true;
                       users.denshi = import ./home.nix;
                       backupFileExtension = "backup";
                       extraSpecialArgs = {
                         inherit inputs;
                       };
                   }; 
               }
               solaar.nixosModules.default

           ];
        };
    };
}
