port#!/bin/bash
A_CF=/etc/bash.bashrc
> $A_CF

echo "
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'
PS1='\u@\h \W]\$ '

case ${TERM} in
  Eterm*|kitty*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|x>
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${P>

    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${P>
    ;;
esac

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi


eval "$(starship init bash)"
export EDITOR=nano
" >> $A_CF

rm -Rv  ~/.bash_history



