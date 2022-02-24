#!/bin/bash

# This will install Arch Linux based on the config here #
# only BIOS boot is supported!                          #
# ----------------------------------------------------- #
# Configruation:
ROOT_DRIVE=/dev/sda1
HOME_DRIVE=none
SWAP_DRIVE=none
# ----------------------------------------------------- #

mkfs.ext4 $ROOT_DRIVE
mount $ROOT_DRIVE /mnt

if [ $HOME_DRIVE != "none" ]; then
	mkfs.ext4 $HOME_DRIVE
	mkdir /mnt/home
	mount $HOME_DRIVE /mnt/home
fi

if [ $SWAP_DRIVE != "none" ]; then
	mkswap $SWAP_DRIVE
	swapon $SWAP_DRIVE
fi

pacstrap /mnt \
	base           base-devel     linux-zen      \
	linux-firmware alacritty      zsh            \
	man-db         man-pages      micro          \
	opendoas       grub           firefox        \
	pulseaudio     bspwm          sxhkd          \
	pulsemixer     exa            thefuck        \
	nitrogen       iwd            dhcpcd

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt << END_CHROOT
# System Configuration:      #
# -------------------------- #
ADMIN="elliot"
ADMIN_PASS="$ADMIN"
ROOT_PASS="root"
HOSTNAME="allsafe"
TIMEZONE=Asia/Kolkata
LANG="en_US.UTF-8"
LOCALENAME="UTF-8"
# -------------------------- #
ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
hwclock --systohc
echo "$LANG $LOCALENAME" >> /etc/locale.gen
locale-gen
echo "LANG=$LANG" >> /etc/locale.conf
echo "$HOSTNAME" >> /etc/hostname
mkinitcpio -P
echo -e "$ROOT_PASS\n$ROOT_PASS" | passwd root
useradd -m $ADMIN
usermod -a -G audio,wheel $ADMIN
echo -e "$ADMIN_PASS\n$ADMIN_PASS" | passwd $ADMIN
ln -sf $(which doas) $(which sudo)
cat > /etc/doas.conf << EOF
permit persist nolog keepenv :wheel as root
EOF
#GRUB INSTALLATION:
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
END_CHROOT
