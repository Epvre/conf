#!/bin/bash
pacman -S --noconfirm --needed nano
pacman -S --noconfirm --needed nano-syntax-highlighting

BASHRC=/etc/bash.bashrc
> $BASHRC

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
" >> $BASHRC
chmod +x BASHRC

 # Get a list of all users in /home
USERS=$(ls /home)
# Loop through each user
for USER in $USERS; do
    # Remove the user's exiting .bashrc file
    rm -Rv "/home/$USER/.bashrc"
        ln -sf $BASHRC "/home/$USER/.bashrc"
        chown $USER:$USER "/home/$USER/.bashrc"
        chmod +x "/home/$USER/.bashrc"
done
echo "All users now have a symbolic link to the common .bashrc file."
```

