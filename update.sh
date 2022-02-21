#!/bin/bash
set -e

for i in $(ls ~/.bin); do
	cp ~/.bin/$i ./bin
done

for i in ~/.bashrc /etc/dnf/dnf.conf ~/.bash_login; do
	cp $i ./
done

cp -r ~/.config/micro ./
