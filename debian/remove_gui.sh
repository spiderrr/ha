#!/bin/bash

# Usuwanie X11 i powiązanych pakietów
sudo apt-get remove --purge x11-common
sudo apt-get remove --purge xserver-xorg*
sudo apt-get remove --purge x11-*
sudo apt-get remove --purge libx11-*
sudo apt-get remove --purge libqt*
sudo apt-get remove --purge libgtk*

# Usuwanie środowisk graficznych i menedżerów okien
sudo apt-get remove --purge gnome*
sudo apt-get remove --purge kde*
sudo apt-get remove --purge xfce4*
sudo apt-get remove --purge lxde*
sudo apt-get remove --purge cinnamon*
sudo apt-get remove --purge mate*
sudo apt-get remove --purge openbox*
sudo apt-get remove --purge fluxbox*
sudo apt-get remove --purge awesome*
sudo apt-get remove --purge i3*

# Usuwanie menedżerów logowania
sudo apt-get remove --purge lightdm*
sudo apt-get remove --purge gdm*
sudo apt-get remove --purge sddm*

# Usuwanie grup pakietów za pomocą tasksel
sudo tasksel remove desktop
sudo tasksel remove gnome-desktop
sudo tasksel remove kde-desktop
sudo tasksel remove xfce-desktop
sudo tasksel remove lxde-desktop
sudo tasksel remove cinnamon-desktop
sudo tasksel remove mate-desktop

# Usuwanie niepotrzebnych zależności i czyszczenie pamięci podręcznej pakietów
sudo apt-get autoremove
sudo apt-get autoclean

# Dodanie zmian do GitHub
git add remove_gui.sh
git commit -m "Remove GUI components"
git push origin main