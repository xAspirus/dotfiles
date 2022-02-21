#!/bin/bash

for i in $(ls ~/.bin); do
	cp ~/.bin/$i ./bin
done

for i in ~/.bashrc /etc/dnf/dnf.conf ~/.bash_login ~/.zshrc ~/.p10k.zsh; do
	cp $i ./
done

cp -r ~/.config/micro ./
rm -r micro/buffers
rm -r micro/backups
