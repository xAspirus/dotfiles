#!/bin/bash
set -e

mkdir ~/.bin

cp bin/* ~/.bin
cp .bashrc ~/.bashrc
cp .bash_login ~/.bash_login
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
