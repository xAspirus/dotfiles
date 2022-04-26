#!/bin/bash

for i in $(ls ~/.bin); do
	cp ~/.bin/$i ./bin
done

for i in ~/.bashrc \
         ~/.bash_login \
         ~/.zshrc \
         ~/.p10k.zsh\
         ~/.config/ptpython; do
	cp -r $i ./
done

cp -r ~/.config/micro ./
rm -r micro/buffers
rm -r micro/backups
