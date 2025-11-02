{pkgs, ...}: {
  imports = [
    ../../modules/common-configuration.nix
    ./hardware-configuration.nix
  ];

  # Machine
  networking.hostName = "nixos";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    kha = {
      isNormalUser = true;
      description = "kha";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [
      ];
    };
  };
}
