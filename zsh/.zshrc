filaban
#neofetch

autoload -U colors && colors
PROMPT="%B%{$fg[red]%}[🌿%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$fg[white]%}%# %b"
RPROMPT="%B%{$fg[green]%}%t%b"
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[white]%}%~%{$fg[red]%}]%b"

#History
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob

#autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

#Vi mode
bindkey -v
export KEYTIMEOUT=1

# edit line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} = '' ]] ||
         [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# load aliases

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle :compinstall filename '/home/fila/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


#aliases

alias imake="cd ../;make;cd -"
alias ls='ls --color=auto'
alias la='ls -lA'
alias c='clear'
alias cls='clear; ls'
alias r='ranger'
alias m='make'
alias mc='make clean'
alias ms='make submission'

alias zshrc='vim ~/.config/zsh/.zshrc'
alias vimrc='vim ~/.vimrc'
alias icf='vim ~/.config/i3/config'

alias mtu='ssh amfila@wopr.csl.mtu.edu'
alias weed='ssh root@frontiercanna.biz'


alias list-sinks='pacmd list-sinks | grep -e "index:" -e "name:"'

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias website='cd ~/projects/web/AndrewFila.github.io'

alias z="zathura"

alias latex='cd ~/dox/latex'


alias serve='browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000'


export PATH="$HOME/classes/cs3331/prog1:$HOME/classes/languages/CminusProject3:/usr/local/anaconda/bin:/bin:/usr/bin:/usr/local/bin:$HOME/scripts:$HOME/projects:$HOME/scripts/layout:$PATH"

#plugins

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-hightlighting.zsh 2>/dev/null
