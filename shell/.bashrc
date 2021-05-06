# Set vi mode
set -o vi

# Set $PATH
export PATH=$HOME/bin:\
/usr/local/sbin:\
/usr/local/opt/coreutils/libexec/gnubin:\
/usr/local/opt/grep/libexec/gnubin:\
/usr/local/opt/gnu-sed/libexec/gnubin:\
/usr/local/opt/gawk/libexec/gnubin:\
/usr/local/opt/inetutils/libexec/gnubin:\
/usr/local/opt/ruby/bin:\
/Users/johngodlee/.gem/ruby/2.7.0/bin:\
${PATH}

# Set #MANPATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:\
/usr/local/opt/grep/libexec/gnuman:\
/usr/local/opt/gnu-sed/libexec/gnuman:\
/usr/local/opt/gawk/libexec/gnuman:\
/usr/local/opt/inetutils/libexec/gnuman:\
${MANPATH}

export LANG=en_US.UTF-8

# History file format
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT="%Y_%m_%d - %H:%M:%S [%Z]"
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# source script to have git branch in prompt
source ~/bin/git-prompt.sh

# Options for git-prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_STATESEPARATOR=" "

# virtualenv prompt
check_virtual_env ()
{
    if test -z "$VIRTUAL_ENV"
    then
        printf -- "%s" ""
    else
        printf -- "%s" "(${VIRTUAL_ENV##*/})"
    fi
}

## Disable default prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Bash prompt
PS1=''
PS1+='\[\e[96m\]$(check_virtual_env)\[\e[m\]' 	# virtualenv
PS1+='[\T]'	# Time
PS1+=' '	# Space 
PS1+='\u@\h'	# User@hostname
PS1+=' ' 	# Space
PS1+='\[\e[31m\]\w\[\e[m\]'	# current dir
PS1+=' '	# Space
PS1+='\[\e[96m\]$(__git_ps1 "[%s]")\[\e[m\]'	# git branch
PS1+='\n'	# New line
PS1+=' $'	# $
PS1+=' '	# Space


# Configure lynx
export LYNX_CFG=~/.lynx/lynx.cfg
export LYNX_LSS=~/.lynx/lynx.lss

# Configure nnn
export NNN_BMS='d:~/Downloads/;h:~/;g:~/google_drive/'
export NNN_OPTS="HRed"
alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"

# Alias cd 
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Alias `ls -G` as `ls` to force colours in `ls`
alias ls="'gls' -A -F -G -g -h -l --group-directories-first --color"

# ls by time modified
alias lst="'gls' -A -F -G -g -h -l -t -r --group-directories-first --color"

# Use neomutt 
alias mutt='neomutt'

# Use VLC ncurses in the terminal
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I ncurses --no-color"

# Use gpg key as default
export GPGKEY=E2388D6F0290C660224F6439215C0880610719F7

# Use Neovim as default $EDITOR
export EDITOR=nvim

# alias vim
alias v=nvim
alias vim=nvim

# Use less as pager
export PAGER=less

# Source bookmarks functions
source $HOME/bin/marks

# Disable macOS Catalina zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# FZF completion etc.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_DEFAULT_OPTS="-m --ansi"

