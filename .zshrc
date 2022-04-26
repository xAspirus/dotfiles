# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#! /usr/bin/zsh


### Antigen
source ~/.bin/antigen.zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
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
alias rm='echo "Use mv ~/.trash"'
zstyle ':completion:*' menu yes select
path+=('/home/aspirus/.bin')
path+=('/home/aspirus/.local/bin')
export EDITOR=micro

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
