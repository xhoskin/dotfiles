# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# functions
s2QuickCommit () {
    git commit -m "$1" src/ web/html/;
    git pull;
    git push
}



# some more ls aliases
alias ack='ack-grep'
alias alert='notify-send --urgency=low -i "$([ $? = 0  ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias autoban_up='rsync -avz --size-only /home/ivanov/projects/mobidec/web/autoban/ root@192.168.0.2:/var/www/common/site/mobidec/web/autoban/'
alias cd-ua='cd ~/projects/uralairlines/web/'
alias cd-uam='cd ~/projects/mobidec/web/ua/'
alias commit-ua-mob-dev='cd-uam && sudo grunt dev --env=lite && cd-ua && gc "mob" mobile/ && gp && mob-ua'
alias commit-ua-mob-prod='cd-uam && sudo grunt prod --env=prod && cd-ua && gc "mobile to prod" mobile/ && gp && mob-ua'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gco='git checkout'
alias gcs='s2QuickCommit'
alias gd='git diff'
alias gl='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias gp='git pull && git push'
alias grep='grep --color=auto'
alias gst='git status'
alias gu='git pull'
alias gull='git pull'
alias gush='git push'
alias jstags='node ~/projects/doctorjs/bin/jsctags.js'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias logo_up='rsync -avz --size-only /home/ivanov/projects/mobidec/web/logo/ root@192.168.0.2:/var/www/common/site/mobidec/web/logo/'
alias ls='ls --color=auto'
alias md='mkdir'
alias mob-ua='cd ~/projects/mobidec/web/ua/ && sudo grunt dev --env=ivanov && sudo grunt watch:dev --env=ivanov '
alias sv='sudo vim'

alias trade-cc='sudo rm -rf app/cache/dev/appDevUrlGenerator.php app/cache/dev/appDevUrlMatcher.php app/cache/prod/appDevUrlGenerator.php app/cache/prod/appDevUrlMatcher.php'
alias trade-gen-cars=tradeGenCars


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# russian language enabled
export LANG=ru_RU.UTF-8

export LC_MESSAGES=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8
export LANGUAGE=ru_RU.UTF-8

# make VIM a default editor
export VISUAL=vim
export EDITOR="$VISUAL"
