#!/usr/bin/env bash

cp /home/denshi/.cache/wal/colors-wal-dwm.h /home/denshi/dots/config/dwm/colors-wal-dwm.h
cp /home/denshi/.cache/wal/colors-wal-st.h /home/denshi/dots/config/st/colors-wal-st.h
cp /home/denshi/.cache/wal/colors-wal-dmenu.h /home/denshi/dots/config/dmenu/colors-wal-dmenu.h

sudo nixos-rebuild switch --flake ~/dots#nixos

echo "done"

