{ pkgs, ...}:

{ 

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono:size=12";
      };
    };
  };
  
  home.packages = with pkgs; [

    wayland
    wayland-protocols
    (pkgs.dwl.overrideAttrs(_ : {
      src = ../config/dwl;
    }))

    wmenu
    wl-clipboard
    grim
    slurp
    playerctl
    wlr-randr
    wbg
    nwg-look

  ];
}
