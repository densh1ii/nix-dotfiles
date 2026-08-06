
{ config, lib, pkgs, curd, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kuwait";

  boot.blacklistedKernelModules = [ "uvcvideo" ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      nvidia-vaapi-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      vulkan-loader
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  services.displayManager.ly.enable = true;

  #services.desktopManager.plasma6.enable = true;
  #environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #  kdeplasma-addons
  #  krdc
  #  krfb
  #  khelpcenter
  #  kate
  #  elisa
  #];
  #services.displayManager.plasma-login-manager.enable = true;

   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

   users.users.denshi = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; 
     packages = with pkgs; [
       tree
     ];
     shell = pkgs.fish;
   };
   programs.fish.enable = true;

   xdg.portal = {
     enable = true;
     extraPortals = with pkgs; [
       xdg-desktop-portal-gtk
       xdg-desktop-portal-hyprland
     ];
   };

   services.flatpak.enable = true;
   services.solaar.enable = true;
   programs.steam.enable = true;
   environment.systemPackages = with pkgs; [
     neovim
     wget
     git
     easyeffects
     curd.packages.${pkgs.stdenv.hostPlatform.system}.default
   ];

   fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono
   ];  
  
   nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "26.05"; 

}

