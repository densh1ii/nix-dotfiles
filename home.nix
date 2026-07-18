{ config, pkgs, inputs, ... }:

{

  imports = [  
    ./modules/desktop.nix
  ];

  home.username = "denshi";
  home.homeDirectory = "/home/denshi";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
      btw = "cowsay i use nixos btw";
      ls = "eza --icons=always -1";
      cd= "z";
      bt = "bluetui";
      ff = "fastfetch";
      sp = "spotify_player";
      nrsf = "sudo nixos-rebuild switch --flake ~/dots#nixos";
      cnix = "nvim ~/dots/configuration.nix";
      chome = "nvim ~/dots/home.nix";
      cflake = "nvim ~/dots/flake.nix";
    };
  };

  programs.librewolf = { enable = true; };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  programs.zoxide = { 
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/denshi/dots/config/nvim/";
    recursive = true;
  };

  gtk = {
      enable = true;

      gtk3.extraConfig = {
          gtk-application-prefer-dark-theme = 1;
      };

      gtk4.extraConfig = {
          gtk-application-prefer-dark-theme = 1;
      };
  };

  home.packages = with pkgs; [
    cowsay
    fastfetch
    vesktop
    pavucontrol
    bluetui
    spotify-player
    vesktop
    vinegar
    fzf 
    mpv
    eza
    prismlauncher
    firefox
    awww
  ];
}
