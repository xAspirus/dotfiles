#!/bin/bash

set -e

cp dnf.conf /etc/dnf/dnf.conf
dnf upgrade

dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf group -y update core
dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
dnf install -y lame\* --exclude=lame-devel
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
dnf group -y upgrade --with-optional Multimedia

dnf install -y openssl
dnf install -y tilix micro gnome-tweaks
flatpak install flathub com.mattjakeman.ExtensionManager
