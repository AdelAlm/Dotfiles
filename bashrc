#---------- PROMPT ---------#
# colors
GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
RED="\[\033[1;31m\]"

# user prompt
if [[ ${EUID} == 0 ]] ; then
    PS1="$WHITE[ $RED\u@\h $WHITE] $RED\w\n$RED#$WHITE> "
else
    PS1="$WHITE[ $GREEN\u@\h $WHITE] $GREEN\w\n$GREEN\$$WHITE> "
fi
#---------------------------#
#--------- ALIASES ---------#
# navigation
alias ..="cd .."
alias ...="cd ../.."

# cleaner
alias q='exit'
alias c='clear'
alias o='open'
alias g='git'
alias v='vim'
alias ll="ls -laF"
alias grep='grep --color=auto'
alias open='xdg-open'

alias uencode="python3 -c 'import sys; import urllib.parse; print(urllib.parse.quote_plus(sys.argv[1]));'"
alias udecode="python3 -c 'import sys; import urllib.parse; print(urllib.parse.unquote_plus(sys.argv[1]));'"

export VISUAL=vim
export EDITOR="$VISUAL"
#---------------------------#

#--------- HISTORY ---------#
export HISTSIZE=10000
export HISTTIMEFORMAT='%d/%m %T '
export HISTCONTROL=ignoreboth # ignore redundant or space commands
export HISTIGNORE='ls:ll:ls -alh:pwd:clear:history' # ignore more
alias hh=hstr # Ctrl + r with hstr
export HISTFILE=~/.bash_history
export HSTR_CONFIG=hicolor
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
#---------------------------#

#----------- SSH -----------#
alias keys='eval $(ssh-agent) && ssh-add'
#---------------------------#

#------- COMPLETION --------#
if [ -f /usr/local/etc/bash_completion ]; then
 source /usr/local/etc/bash_completion
fi
#---------------------------#

#-------- FUNCTIONS --------#
# cd with ls
cd() {
  builtin cd "$@" && ls -lA
}
#---------------------------#

#---------- TMUX -----------#
if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then 
  #exec 
  tmux new -A -s basique
fi
#---------------------------#

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# docker
alias dockershell="sudo docker run --rm -i -t --entrypoint=/bin/bash"  
alias dockershellsh="sudo docker run --rm -i -t --entrypoint=/bin/sh"

function dockershellhere() {  
  dirname=${PWD##*/}
  sudo docker run --rm -it --entrypoint=/bin/bash -v `pwd`:/${dirname} -w /${dirname} "$@"
}
function dockershellshhere() {  
  dirname=${PWD##*/}
  sudo docker run --rm -it --entrypoint=/bin/sh -v `pwd`:/${dirname} -w /${dirname} "$@"
}

nginxhere() {
  sudo docker run --rm -it -p 80:80 -p 443:443 -v "${PWD}:/srv/data" nginxserver
}

metasploit() {
  sudo docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" metasploitframework/metasploit-framework ./msfconsole "$@"
}

metasploitports() {
  sudo docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -p 10000-10010:10000-10010 metasploitframework/metasploit-framework ./msfconsole "$@"
}

msfvenom() {
  sudo docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -v "${PWD}:/data" metasploitframework/metasploit-framework ./msfvenom "$@"
}
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
