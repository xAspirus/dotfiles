#!/bin/bash
mkdir ~/.bin
mkdir ~/.config/
cp -r bin/* ~/.bin
cp .bashrc ~/.bashrc
cp .bash_login ~/.bash_login
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
cp -r micro ~/.config/
cp -r ptpython ~/.config/
