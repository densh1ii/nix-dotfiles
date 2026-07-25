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
      ff = "fastfetch -c ~/dotfiles/config/fastfetch/config.jsonc";
      fff="fastfetch";
      sp = "spotify_player";
      nrsf = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
      cnix = "nvim ~/dots/configuration.nix";
      chome = "nvim ~/dots/home.nix";
      cflake = "nvim ~/dots/flake.nix";
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
    source = config.lib.file.mkOutOfStoreSymlink "/home/denshi/dotfiles/config/nvim/";
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

  home.packages = with pkgs; [
    fastfetch
    vesktop
    pavucontrol
    bluetui
    spotify-player
    fzf
    mpv
    eza
    prismlauncher
    firefox
    picom 
    feh
    flameshot
    xclip
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
  ];

}
