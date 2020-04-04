#!/bin/bash
# Window Title: https://github.com/psifidotos/applet-window-title
sudo pacman -S --needed --noconfirm kdeclarative
git clone https://github.com/psifidotos/applet-window-title.git
cd applet-window-title
plasmapkg2 -i .
cd ..
sudo rm -r applet-window-title
# Window Appmenu: https://github.com/psifidotos/applet-window-appmenu
sudo pacman -S --needed --noconfirm qt5-quickcontrols xcb-util xorg-xrandr extra-cmake-modules plasma-framework kwindowsystem appmenu-gtk-module libdbusmenu-gtk3
git clone https://github.com/psifidotos/applet-window-appmenu.git
cd applet-window-appmenu
sh install.sh
cd ..
sudo rm -r applet-window-appmenu
# Window Buttons: https://github.com/psifidotos/applet-window-buttons
sudo pacman -S --needed --noconfirm kcoreaddons kdeclarative plasma-framework extra-cmake-modules
git clone https://github.com/psifidotos/applet-window-buttons.git
cd applet-window-buttons
sh install.sh
cd ..
sudo rm -r applet-window-buttons
# Rofi Applets & Menus: https://github.com/adi1090x/rofi
sudo pacman -S --needed --noconfirm rofi
sudo rm -r ~/.config/rofi
mkdir ~/.config/rofi
cd ~/.config/rofi
git clone https://github.com/adi1090x/rofi.git
cd rofi && chmod +x scripts/*
cp -r bin scripts themes launchers launchers-git config.rasi ~/.config/rofi
cd .. && sudo rm -r rofi