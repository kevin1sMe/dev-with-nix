{
  description = "kevin's HomeManager Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # nvimdots
    nvimdots.url = "github:ayamir/nvimdots";

    # 给指定版本的kubectl使用的nixpkgs
    nixpkgs-for-kubectl.url = "github:NixOS/nixpkgs/e7e54ace729a1e88177c0121d05f35352b05aed8";

    # home-manager，用于管理用户配置
    home-manager = {
      # url = "github:nix-community/home-manager/release-23.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = { self, nixpkgs, nixpkgs-for-kubectl,  home-manager, nvimdots, ... } @inputs: 
    let 
      userConfigContent = builtins.readFile ~/.dev-with-nix.toml;
      userConfig = builtins.fromTOML userConfigContent;
      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};
          specialArgs = {
              inherit userConfig nvimdots nixpkgs-for-kubectl;
              pkgs-for-kubectl = import nixpkgs-for-kubectl {
              system = system;
              config.allowUnfree = true;
            };
            };
    in {
        homeConfigurations = {
          dev = home-manager.lib.homeManagerConfiguration {
            inherit pkgs ;
            modules = [
                ./home-manager/home.nix
            ];
            extraSpecialArgs = specialArgs;
          };
        };

        defaultPackage.${system} = self.homeConfigurations.dev.activationPackage;
   };
}
