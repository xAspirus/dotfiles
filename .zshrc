# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#                 ██                    
#                ░██                    
#  ██████  ██████░██      ██████  █████ 
# ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#    ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░ 
#   ██    ░░░░░██░██  ░██ ░██   ░██   ██
#  ██████ ██████ ░██  ░██░███   ░░█████ 
# ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░  

### Plugins

source ~/.bin/antigen.zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply

### Theme


### History

HISTFILE=~/.erhieuohte
SAVEHIST=100
HISTSIZE=100

### Keybindings

bindkey "^[[1;5D" backward-word 
bindkey "^[[1;5C" forward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Insert "sudo " at the beginning of the line
function prepend-sudo {
  if [[ $BUFFER != "sudo "* ]]; then
    BUFFER="sudo $BUFFER"; CURSOR+=5
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

zstyle ':completion:*' menu yes select
path+=('/home/aspirus/.bin')
path+=('/home/aspirus/.nimble/bin')
export SUDO_PROMPT='[sudo] Password: '
export EDITOR=micro

# ### Prompt
# 
# export EXECTIME=0
# prompt='$(prompt $PWD $? "$EXECTIME" $COLUMNS) $(echo -en "\e]2;\a")'
# 
# function preexec() {
#   timer=$(($(date +%s%0N)/1000000))
# }
# 
# function precmd() {
#   if [ $timer ]; then
#     now=$(($(date +%s%0N)/1000000))
#     elapsed=$(($now-$timer))
# 
#     export EXECTIME=$elapsed
#     unset timer
#   fi
# }

eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /etc/profile.d/vte.sh

