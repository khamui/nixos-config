{
  description = "khamui's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    # unattended updates; its nixpkgs is not followed, so updating nixpkgs never rebuilds the updater itself
    flake-updater.url = "github:khamui/flake-updater";
  };

  outputs = {
    nixpkgs,
    nvf,
    home-manager,
    alacritty-theme,
    flake-updater,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Apply overlay at system level
          ({...}: {
            nixpkgs.overlays = [alacritty-theme.overlays.default];
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kha = import ./home/nixos;

            # Pass alacritty theme input to home.nix
            home-manager.extraSpecialArgs = {
              inherit alacritty-theme nvf;
            };
          }

          ./hosts/nixos/configuration.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Apply overlay at system level
          ({...}: {
            nixpkgs.overlays = [alacritty-theme.overlays.default];
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.khamui = import ./home/laptop;

            # Pass alacritty theme input to home.nix
            home-manager.extraSpecialArgs = {
              inherit alacritty-theme nvf;
            };
          }

          flake-updater.nixosModules.default
          ./hosts/laptop/configuration.nix
        ];
      };
    };
  };
}
