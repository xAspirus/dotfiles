#!/usr/bin/env python3
from rich import print
import base64
import rich_click as click
import subprocess as sp


def sh(command: str) -> str:
	print('[bright_blue] sh % [/bright_blue]' + command)
	return sp.check_output(['sh', '-c', command]).decode('UTF-8')


def load_config(config_path: str) -> tuple[list[str], list[str]]:
	with open(config_path, 'r') as fp:
		file = fp.read()
		file = [i.strip() for i in file.split('\n') if i.strip() != '']
		files = []
		folders = []
		mkfolders = []
		state = files
		for i in file:
			if i == 'Files:':
				state = files
			elif i == 'Folders:':
				state = folders
			elif i == 'MkFolders:':
				state = mkfolders
			else:
				state.append(i)
		return files, folders, mkfolders


@click.command()
@click.option('--update/--no-update', default=False, type=bool, help='Copy files into repository instead of installing dotfiles.')
def main(update):
	files, folders, mkfolders = load_config('files.txt')
	
	for folder in mkfolders:
		sh(f'mkdir -p {folder}')
	
	for file in files:
		file_hashed = base64.b64encode(file.encode('ascii'), altchars=b'_-').decode('ascii')
		
		if update:
			sh(f'cp -r {file} {file_hashed}')
		else:
			sh(f'cp -r {file_hashed} {file}')
	
	for file in folders:
		file_hashed = base64.b64encode(file.encode('ascii'), altchars=b'_-').decode('ascii')
		
		if update:
			try:
				sh(f'cp -rf {file}/. {file_hashed}/.')
			except:
				sh(f'cp -rf {file}/. {file_hashed}')
		else:
			try:
				sh(f'cp -rf {file_hashed}/. {file}/.')
			except:
				sh(f'cp -rf {file_hashed}/. {file}')


main()
