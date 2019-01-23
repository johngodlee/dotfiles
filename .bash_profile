# Set vi mode
set -o vi

# Add ~/bin to path for custom scripts
export PATH=/anaconda3/bin:/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/bin:$HOME/bin:$PATH

# Alias `hub` as `git`, allows hub commands to be run using git
eval "$(hub alias -s)"

# History file format
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%Y_%m_%d - %H:%M:%S [%Z]"

## source script to have git branch in prompt
source ~/.git-prompt.sh

## Options for git-prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_STATESEPARATOR=" "

# add Anaconda virtualenv to prompt

check_conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf -- "%s" "($CONDA_DEFAULT_ENV)"
    else
        printf -- "%s" ""
    fi
}

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
PS1+='\[\e[34m\]$(check_conda_env)\[\e[m\]'
PS1+=' '	# Space
PS1+='\n'	# New line
PS1+='┗'	# Elbow
PS1+='$'	# $
PS1+=' '	# Space

# Open to root as default
cd ~ 

# Clean slate action
alias cls="clear; ls"

# Alias `ls -G` as `ls` to force colours in `ls`
alias ls='ls -G -A -F -l -h'

# Alias cmus to listen for remotes on network - deactivated, interferes with cmus-control
# alias cmus='cmus --listen 0.0.0.0'

# Set an alias for viewing pdf content in less
function lesspdf { pdftotext -layout "$1" - | less; }

# Use gnu-sed instead of osx sed
alias sed=gsed

# Alias to open w3m with duckduckgo.com
alias w3m_h='w3m www.duckduckgo.com'

# Open (neo)mutt in Downloads to save attachments there, and always run offlineimap and notmuch build before opening
alias mutt='cd ~/Downloads; notmuch new; neomutt'

alias neomutt='cd ~/Downloads; notmuch new; neomutt'

# Use VLC ncurses in the terminal

alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I ncurses"

# Use pirate-get with aria2c to download torrents
torrent() { pirate-get "$1" -C "aria2c '%s'" ; }  

# Use gpg key as default
export GPGKEY=E79A8F461D9BC674 

# Use vim as default $EDITOR
export EDITOR=vim

# Git aliases
alias gall="git add -A; git commit"
alias gp="git pull; git push"

# Add filesystem bookmarks functions:

## Define path to bookmarks file
export MARKPATH=$HOME/.marks

## Jump to a mark
function jump { 
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

## Add a mark in current dir
function mark { 
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

## Remove a mark by giving its name
function unmark { 
	rm -i "$MARKPATH/$1"
}

## Display all marks
function marks {
	\ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

## Alias bookmarks for marks
alias bookmarks='marks'


export PYTHON_CONFIGURE_OPTS="--enable-framework"

# cd to current directory visible in finder
cdf () {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]
        then
                cd "$target"
                pwd
        else
                echo 'No Finder window found' >&2
        fi
}


# Use vim as man pager
# export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
# Use vim in clientserver mode
# alias vim="vim --client-server"

