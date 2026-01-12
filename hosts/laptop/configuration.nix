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
  #networking.wireless.enable = false;
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics.enable = true;
  boot.kernelModules = ["amd-pstate"];
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x10" # Better power managemet
    "amd_pstate=active"
  ];
  # deactivate webcam
  boot.blacklistedKernelModules = ["uvcvideo"];
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

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      PLATFORM_PROFILE_ON_AC = "balanced";
      PLATFORM_PROFILE_ON_BAT = "low-power";
      RUNTIME_PM_ON_BAT = "auto";
      RUNTIME_PM_ON_AC = "on";
      USB_AUTOSUSPEND = 1;
      WIFI_PWR_ON_BAT = "on";
      DISK_DEVICES = "nvme0n1";
      DISK_APM_LEVEL_ON_BAT = "128";
      BLUETOOTH_POWER_ON_BAT = "off";

      # Battery charge thresholds
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;

      # Optional: enable battery care options
      RESTORE_THRESHOLDS_ON_BAT = 1;
      RESTORE_THRESHOLDS_ON_AC = 1;

      # You can also tune power modes
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;
    };
  };

  # Disable conflicting daemon
  services.power-profiles-daemon.enable = false;

  programs.firefox.enable = true;
  #services.pcscd.enable = true;
  #services.pcscd.plugins = [pkgs.ccid];

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    powertop
    ryzen-monitor-ng # AMD CPU monitoring
    gimp
  ];
}
