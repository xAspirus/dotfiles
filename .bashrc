#!/bin/bash

function return_color {
	if [ $1 != "0" ]; then
		printf "\e[31m%s> " $1
	else
		printf "\e[32m> " $1
	fi
	return $1
}

PS1='\w> '
