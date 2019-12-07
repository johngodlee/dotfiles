# Set vi mode
set -o vi

# Add ~/bin to path for custom scripts
export PATH=/Users/johngodlee/Library/Python/3.6/bin:\
/usr/local/Caskroom/miniconda/4.6.14/miniconda3/bin:\
/Users/johngodlee/.gem/ruby/2.6.0/bin:\
/usr/local/bin:\
/usr/local/opt/gnu-sed/libexec/gnubin:\
/usr/local/opt/ruby/bin:\
/usr/bin:\
$HOME/bin:\
$PATH

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
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I ncurses"

# Use gpg key as default
export GPGKEY=E2388D6F0290C660224F6439215C0880610719F7

# Use Vim as default $EDITOR
export EDITOR=vim

# Git aliases
alias gall="git add -A; git commit"
alias gp="git pull; git push"

# Run vim calendar plugin
alias calendar="vim -c Calendar"

# Define path to bookmarks file
export MARKPATH=$HOME/.marks

# Alias bookmarks for marks
alias bookmarks='marks'

# Some installers require CPython built with --enable-framework
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Disable macOS Catalina zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/4.6.14/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/4.6.14/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/4.6.14/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/4.6.14/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

