{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs@{ self, nixpkgs, home-manager, aagl , ... }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.suckless = pkgs.mkShell{
      packages = with pkgs; [
          pkg-config
          libX11
          libXft
          libXinerama
          fontconfig
          freetype
          harfbuzz
          gcc
          gnumake
          imlib2
        ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {

      specialArgs = {inherit inputs;};
      
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
        }
        aagl.nixosModules.default
        {

          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
          #programs.anime-games-launcher.enable = true;
          #programs.honkers-railway-launcher.enable = true;
          #programs.honkers-launcher.enable = true;
          #programs.wavey-launcher.enable = true;
          #programs.sleepy-launcher.enable = true;
        }
      ];
    };
  };
}
