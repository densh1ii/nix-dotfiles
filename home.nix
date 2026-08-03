{ config, pkgs, ...}:

{
   home.username = "denshi";
   home.homeDirectory = "/home/denshi";
   home.stateVersion = "26.05";
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

  xsession.windowManager.i3 = {
    enable = true;
  };

  home.file.".config/i3" = {
    source = ./config/i3;
    onChange = ''
        ${pkgs.i3}/bin/i3-msg reload
      '';
    };

  xdg.configFile."polybar/config.ini".source = ./config/polybar/config.ini;
  xdg.configFile."alacritty.toml".source = ./config/alacritty/alacritty.toml;
  xdg.configFile."picom.conf".source = ./config/picom/picom.conf;
  xdg.configFile."rofi/config.rasi".source = ./config/rofi/config.rasi;

  home.packages = with pkgs; [
    fastfetch
    vesktop
    discord
    pavucontrol
    bluetui
    spotify
    fzf
    mpv
    eza
    prismlauncher
    firefox
    picom 
    feh
    flameshot
    xclip
    copyq
    unzip
    zip
    unrar
    tree-sitter
    gcc
    gnumake
    rofi
    (polybar.override {
      i3Support = true;
      pulseSupport = true;
    })
    vulkan-tools
    alacritty
    dunst
    yazi
    playerctl
    vinegar
    lunar-client
    betterlockscreen
  ];

}
