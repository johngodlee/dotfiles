# Put this in .bashrc for linux, mac is unique in sourcing terminal from source every window

# Add ~/bin to path for custom scripts
export PATH=/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/bin:$HOME/bin:$PATH

# Alias `hub` as `git`, allows hub commands to be run using git
eval "$(hub alias -s)"

# append to history, don't overwrite each session
shopt -s histappend

# Set history length (lines)
HISTSIZE=1000
HISTFILESIZE=2000

## source script to have git branch in prompt
source ~/.git-prompt.sh

## Options for git-prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_STATESEPARATOR=" "

## Bash prompt
PS1='┏'	# Elbow
PS1+='[\T]'	# Time
PS1+=' '	# Space 
PS1+='\u@\h'	# User@hostname
PS1+=' ' 	# Space
PS1+='\[\e[31m\]\w\[\e[m\]'	# current dir
PS1+=' '	# Space
PS1+='\[\e[96m\]$(__git_ps1 "[%s]")\[\e[m\]'	# git branch
PS1+=' '	# Space
PS1+='\n'	# New line
PS1+='┗'	# Elbow
PS1+='$'	# $
PS1+=' '	# Space

# Open to root as default
cd ~ 

# Alias `ls -G` as `ls` to force colours in `ls`
alias ls='ls -G -A -F'
alias ll='ls -lG -A -F'

# Alias cmus to listen for remotes on network - deactivated, interferes with cmus-control
# alias cmus='cmus --listen 0.0.0.0'

# Always start vim in client server mode
# alias vim='vim --servername VIM'

# Use gnu-sed instead of osx sed
alias sed=gsed

# Alias to open w3m with duckduckgo.com
alias w3m_h='w3m www.duckduckgo.com'

# Open mutt in Downloads to save attachments there
alias mutt='cd ~/Downloads; mutt'

# Use pirate-get with aria2c
torrent() { pirate-get "$1" -C "aria2c '%s'" ; }  

# Use gpg key as default
export GPGKEY=E79A8F461D9BC674 

# Use vim as default $EDITOR
export EDITOR=vim

# Use vim as man pager
# export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"

export PYTHON_CONFIGURE_OPTS="--enable-framework"
