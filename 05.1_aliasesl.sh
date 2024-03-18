#!/bin/bash
A_CF=~/.bashrc
> $A_CF

echo "
alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'
PS1='\u@\h \W]\$ '

eval "$(starship init bash)"
EDITOR=nano
" >> $A_CF

rm -Rv  ~/.bash_history



