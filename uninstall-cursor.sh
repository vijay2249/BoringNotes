#!/bin/bash

username=$(whoami)
echo "username: $username"

echo "removing cursor theme related files"
#remove cursor theme
rm -rf /etc/alternatives/x-cursor-theme
rm -rf /var/lib/dpkg/alternatives/x-cursor-theme


echo "#remove cursor update cache"
rm -rf /home/$username/.cache/cursor-updater

echo "#remove cursor tutorials"
rm -rf /home/$username/.cursor-tutor

echo "#remove basic cursor default settings and extensions"
rm -rf /home/$username/.cursor

echo "#remove config cache"
rm -rf /home/$username/.config/Cursor/User/workspaceStorage/

echo "#remove cursor cached extensions"
rm -rf /home/$username/.config/Cursor/CachedExtensionVSIXs/

echo "#remove cursor logs"
rm -rf /home/$username/.config/Cursor/logs/

echo "#remove cursor icons"
rm -rf /usr/share/icons/Adwaita/cursors/
rm -rf /usr/share/icons/Adwaita/cursor.theme
rm -rf /usr/share/icons/Windows-10-Icons/cursors/
rm -rf /usr/share/mime/image/x-xcursor.xml

echo "#remove cursor OS specific commands"
rm -rf /usr/share/tcltk/tk8.6/ttk/cursors.tcl

echo "#remove desktop application details"
rm -rf /usr/share/applications/cursor.dekstop

echo "#remove appimage and related files"
rm -rf /opt/cursor.AppImage
rm -rf /opt/cursor.png
