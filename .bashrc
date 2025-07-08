#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah'
alias l='ls'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
