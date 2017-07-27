# Put this in .bashrc for linux, mac is unique in sourcing terminal from source every window

# Add ~/bin to path for custom scripts
export PATH=/usr/local/bin:$HOME/bin:$PATH

# Alias `hub` as `git`, allows hub commands to be run using git
eval "$(hub alias -s)"

# append to history, don't overwrite each session
shopt -s histappend

# Set history length (lines)
HISTSIZE=1000
HISTFILESIZE=2000

# Customise bash prompt
PS1='[\A\[$(tput sgr0)\]]\u\[\e[31m\] \w \[\e[m\]$ '

# Open to root as default
cd ~ 

# Alias `ls -G` as `ls` to force colours in `ls`
alias ls='ls -G -A -F'
alias ll='ls -lG -A -F'

# Alias cmus to listen for remotes on network
alias cmus='cmus --listen 0.0.0.0'

# Always start vim in client server mode
alias vim='vim --servername VIM'

# Use gnu-sed instead of osx sed
alias sed=gsed

# Use gpg key as default
export GPGKEY=E79A8F461D9BC674 

# Use vim as default $EDITOR
export EDITOR=vim
