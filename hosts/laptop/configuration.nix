# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    ../../modules/common-configuration.nix
    ./hardware-configuration.nix
  ];

  # Machine
  networking.hostName = "laptop";

  users.users = {
    khamui = {
      isNormalUser = true;
      description = "khamui";
      extraGroups = ["networkmanager" "wheel" "video" "audio"];
      initialPassword = "changeme";
      packages = with pkgs; [
        thunderbird
      ];
    };
  };

  ###############################
  # Specific X13 GEN4 AMD config#
  ###############################
  networking.wireless.enable = false;
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.opengl.enable = true;
  boot.kernelModules = ["amd-pstate"];
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x10" # Better power managemet
    "amd_pstate=active"
  ];
  services.power-profiles-daemon.enable = true; # Modern alternative to TLP
  services.thermald.enable = false; # thermald is Intel-only
  services.fwupd.enable = true; # Firmware updates via LVFS
  services.fprintd.enable = true;
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = false;
      tapping = true;
    };
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    powertop
    ryzen-monitor-ng # AMD CPU monitoring
  ];
}
