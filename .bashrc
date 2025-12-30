#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah'
alias l='ls'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

export PATH="$PATH:$HOME/.dotnet/tools:$HOME/.local/bin"

eval "$(starship init bash)"
