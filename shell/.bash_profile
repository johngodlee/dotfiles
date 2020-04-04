# Set vi mode
set -o vi

# Set $PATH
export PATH=$HOME/bin:\
/usr/local/opt/coreutils/libexec/gnubin:\
/usr/local/opt/grep/libexec/gnubin:\
/usr/local/opt/gnu-sed/libexec/gnubin:\
/usr/local/opt/gawk/libexec/gnubin:\
${PATH}

# Set #MANPATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:\
/usr/local/opt/grep/libexec/gnuman:\
/usr/local/opt/gnu-sed/libexec/gnuman:\
/usr/local/opt/gawk/libexec/gnuman:\
${MANPATH}"

# Alias `hub` as `git`, allows hub commands to be run using git
eval "$(hub alias -s)"

# History file format
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT="%Y_%m_%d - %H:%M:%S [%Z]"

## source script to have git branch in prompt
source ~/bin/git-prompt.sh

## Options for git-prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_STATESEPARATOR=" "

## Disable default prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

## Bash prompt
PS1=''
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

# Source completion scripts
source $HOME/bin/jump_completion

# Alias `ls -G` as `ls` to force colours in `ls`
alias ls="'gls' -A -F -G -g -h -l --group-directories-first --color"

# ls by time modified
alias lst="'gls' -A -F -G -g -h -l -t -r --group-directories-first --color"

# Configure default env. vars for lynx
LYNX_CFG=~/.lynx/lynx.cfg; export LYNX_CFG
LYNX_LSS=~/.lynx/lynx.lss; export LYNX_LSS

# Open (neo)mutt in Downloads to save attachments there,
# always run notmuch build before opening
alias mutt='cd ~/Downloads; notmuch new; neomutt'
alias neomutt='cd ~/Downloads; notmuch new; neomutt'

# Use VLC ncurses in the terminal
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I ncurses --no-color"

# Source bookmarks functions
source $HOME/bin/marks

# Use gpg key as default
export GPGKEY=E2388D6F0290C660224F6439215C0880610719F7

# Use Vim as default $EDITOR
export EDITOR=vim

# Use less as pager
export PAGER=less

# Git aliases
alias gall="git add -A; git commit"
alias gp="git pull; git push"

# Run vim calendar plugin
alias calendar="vim -c Calendar"

# Use ripgrep
alias grep="rg"

# Open todo file
alias todo="vim $HOME/google_drive/notes/todo.md"

# Define path to bookmarks file
export MARKPATH=$HOME/.marks

# Alias bookmarks for marks
alias bookmarks='marks'

# Some installers require CPython built with --enable-framework
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Disable macOS Catalina zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1
