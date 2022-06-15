#! /usr/bin/zsh


### Antigen
source ~/.antigen.zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle reobin/typewritten@main
	### Theme
	TYPEWRITTEN_PROMPT_LAYOUT="singleline"
	TYPEWRITTEN_RELATIVE_PATH="home"
	TYPEWRITTEN_SYMBOL='$'
	TYPEWRITTEN_ARROW_SYMBOL=">"
	TYPEWRITTEN_CURSOR="terminal"
	TYPEWRITTEN_RIGHT_PROMPT_PREFIX="# "

antigen apply


### History
HISTFILE=~/.history
SAVEHIST=65536
HISTSIZE=65536


### Keybinds
bindkey "^[[1;5D" backward-word 
bindkey "^[[1;5C" forward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
function prepend-sudo {
  if [[ $BUFFER != "doas "* ]]; then
    BUFFER="doas $BUFFER"; CURSOR+=5
  fi
}
zle -N prepend-sudo
bindkey "^K" prepend-sudo


### (ArchWiki): Colored Output In Console 
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'


### Aliases
alias ls='exa'
alias ll='ls -l --no-permissions --no-user'
alias la='ls -a'
alias lla='ll -a'
alias lt='ls -TL=3'
alias cc='gcc -Wall'
alias py='ptpython'
#alias rm='trash'
alias git_add_all_commit_push='git add . && git commit -m e && git push'
#alias rm='echo "Use mv ~/.trash"'
zstyle ':completion:*' menu yes select
path+=('/home/aspirus/.bin')
path+=('/home/aspirus/.local/bin')
export EDITOR=micro
export MICRO_TRUECOLOR=1


alias pbay='python3 /home/aspirus/Projects/pbay/pbay'
alias spkg='python3 /home/aspirus/Projects/SPM/spm'
alias ytdl='python3 /home/aspirus/Projects/youtube-dl-sync/youtube-dl-sync'


alias wifi-connect='iwctl station wlan0 connect'
