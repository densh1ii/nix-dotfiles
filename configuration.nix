# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

#let 
#    home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz;
#in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.denshi = import ./home.nix;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "Asia/Kuwait";

  boot.blacklistedKernelModules = [ "uvcvideo" ];
  
 # programs.hyprland = {
 #  enable = true;
 #  withUWSM = true;
 # };

  services.pipewire = {
     enable = true;
     pulse.enable = true;
  };

   programs.fish.enable = true;
   users.users.denshi = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
     shell = pkgs.fish;
   };
 
  nixpkgs.config.allowUnfree = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ 
    "modesetting" 
    "nvidia" 
  ];
  
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    prime = {
       offload.enable = true;
       intelBusId = "PCI:0:2:0";
       nvidiaBusId = "PCI:1:0:0"; 
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-utils
    ];
  };
  services.flatpak.enable = true;
  programs.dconf.enable = true;
  programs.steam = {enable = true;};
  environment.systemPackages = with pkgs; [
    wget
    neovim
    bat
    git
    btop
    lufus
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    liberation_ttf
    dejavu_fonts
    ipaexfont
    ipafont
    corefonts
    vista-fonts
  ];

  # List services that you want to enable:

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "26.05"; 

}

