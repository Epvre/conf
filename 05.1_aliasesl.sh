#!/bin/bash
A_CF=~/.bashrc

echo "
alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'
PS1='\u@\h \W]\$ '

eval "$(starship init bash)"
" >> $ACF
