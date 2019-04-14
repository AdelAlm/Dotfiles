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
alias -- -="cd -"

# cleaner
alias q='exit'
alias c='clear'
alias o='open'
alias h='history'

# git
alias g='git'
alias gsta='git status'
alias gcom='git commit'
alias gclo='git clone'
alias glog='git log --oneline'
alias gadd.='git add .'
alias gaddp='git add -p'
alias gdiff='git diff'

# edition
alias v='vim'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'

# others
alias ll="ls -laF"
alias grep='grep --color=auto'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

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
