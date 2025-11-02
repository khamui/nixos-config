{
  description = "khamui's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = {
    nixpkgs,
    nvf,
    home-manager,
    alacritty-theme,
    ...
  }: {
    nixosConfigurations.wiegtnix = nixpkgs.lib.nixosSystem {
      modules = [
        # Apply overlay at system level
        ({...}: {
          nixpkgs.overlays = [alacritty-theme.overlays.default];
        })

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.kha = import ./home;

          # Pass alacritty theme input to home.nix
          home-manager.extraSpecialArgs = {
            inherit alacritty-theme nvf;
          };
        }

        ./configuration.nix
      ];
    };
  };
}
