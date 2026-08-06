{ config, pkgs, inputs, ...}:

{
   
   imports = [
      inputs.spicetify-nix.homeManagerModules.default
     ./modules/Spicetify.nix
   ];

   home.username = "denshi";
   home.homeDirectory = "/home/denshi";
   home.stateVersion = "26.05";

   home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Gruvbox";
    size = 24;
  };

   programs.fish = {
    enable = true;
    shellAliases = {
      btw = "cowsay i use nixos btw";
      ls = "eza --icons=always -1";
      cd= "z";
      bt = "bluetui";
      ff = "fastfetch -c ~/nix-dotfiles/config/fastfetch/config.jsonc";
      fff="fastfetch";
      nrsf = "sudo nixos-rebuild switch --flake ~/nix-dotfiles#nixos";
      cnix = "nvim ~/nix-dotfiles/configuration.nix";
      chome = "nvim ~/nix-dotfiles/home.nix";
      cflake = "nvim ~/nix-dotfiles/flake.nix";
    };
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/denshi/nix-dotfiles/config/nvim/";
    recursive = true;
  };

  xdg.configFile."rofi/config.rasi".source = ./config/rofi/config.rasi;
  xdg.configFile."hypr/hyprland.lua".source = ./config/hypr/hyprland.lua;
  xdg.configFile."kitty/kitty.conf".source = ./config/kitty/kitty.conf ;

  home.packages = with pkgs; [
    fastfetch
    vesktop
    fzf
    mpv
    eza
    prismlauncher
    firefox
    unzip
    zip
    unrar
    tree-sitter
    gcc
    gnumake
    vulkan-tools
    playerctl
    vinegar
    lunar-client
    bluetui
    hyprlock
    hypridle
    rofi
    hyprshot
    waybar
    kitty
    pavucontrol
    bibata-cursors
  ];

}
