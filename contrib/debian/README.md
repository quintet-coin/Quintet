
Debian
====================
This directory contains files used to package quintetd/quintet-qt
for Debian-based Linux systems. If you compile quintetd/quintet-qt yourself, there are some useful files here.

## quintet: URI support ##


quintet-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install quintet-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your quintetqt binary to `/usr/bin`
and the `../../share/pixmaps/quintet128.png` to `/usr/share/pixmaps`

quintet-qt.protocol (KDE)

