# source global rc file
[ -f /etc/bash/bashrc ] && source /etc/bash/bashrc


# activate bash-completion
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

case $TERM in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
		PROMPT_COMMAND='echo -ne "\033]0;[ ${USER}@${HOSTNAME%%.*} ] ${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_[[ ${USER}@${HOSTNAME%%.*} ]] ${PWD/$HOME/~}\033\\"'
		;;
esac

# better line wraping
shopt -s checkwinsize

# enable cdspell
shopt -s cdspell

# complete dirs only
complete -d cd

# stop bash from caching duplicate lines
export HISTCONTROL=ignoredups

# use libtrash
# export LD_PRELOAD=/usr/lib/libtrash.so

export GIT_PAGER=''


# environment variables
# PATH=.:~/.bin:~/android.com/android-sdk-linux_x86/tools:/opt/qtcreator-2.0.0/bin/:${PATH}:${RYZOM_PATH}/tools/scripts/linux
PATH=.:~/.bin:/opt/qtcreator-2.0.0/bin/:${PATH}
export PAGER=/usr/bin/most
#export CPATH=~/fh/ogl

export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"
export LANGUAGE="en_US.utf8"

export LC_MESSAGES="en_US.utf8" 
export LC_CTYPE="de_DE.utf8"
export LC_NUMERIC="de_DE.utf8"
export LC_TIME="C"
export LC_COLLATE="de_DE.utf8"
export LC_MONETARY="de_DE.utf8"

# shell prompt
PS1='\[\033[1;30m\][\[\033[01;31m\] \h: \[\033[1;32m\]\w\[\033[1;30m\] ]\n\[\033[1;30m\][\[\033[1;37m\] $ \[\033[1;30m\]] \[\e[0m\]'


# aliases
alias ls='ls --color=auto -X'
alias ll='ls -Flh'
alias la='ls -lhA'
alias l='ls -CFh'
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -hT'
alias du='du -h'
alias mc='mc -b'
alias free='free -m'
alias vi='vim'
alias gvi='gvim'
alias h='history' 
alias cal='cal -m'
alias grep='grep --color=auto'
alias hsgrep='history | grep' 
alias psgrep='ps aux | grep'
alias wtf='dmesg'
# alias firefox='LD_PRELOAD=/lib/libc.so.6 firefox'
alias bp='cd ~/devel/basicpyhsics'
alias sc='cd ~/devel/shengci'
alias halt='/sbin/halt' 
alias reboot='/sbin/reboot'
# alias priv='unset HISTFILE'

# spelling typos - highly personnal :-)
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias mroe='more'
alias kk='ll'
