#!/bin/sh

#  
# imapserver=$(cat ~/.offlineimaprc | grep remotehost | awk '{print $3}')
# 
# imapactive=$(ps -ef | grep '[o]fflineimap' | wc -l)
# 
# netactive=$(ping -c3 $imapserver >/dev/null 2>&1 && echo up || echo down)
# 
# mailsync="/usr/local/bin/offlineimap -u quiet -q"
# 
# # kill offlineimap if active, sometimes it hangs
# case $imapactive in
# '1')
#     killall offlineimap && sleep 5
# ;;
# esac
# 
# # Check that you can access the SMTP server
# case $netactive in
# 'up')
#     $mailsync
# ;;
# 'down')
#     :
# ;;
# esac

# Check every ten seconds if the process identified as $1 is still
# running. After 10 checks (~120 seconds), kill it. Return non-zero to
# indicate something was killed.
monitor() {
  local pid=$1 i=0

  while ps $pid &>/dev/null; do
    if (( i++ > 6 )); then
      kill -9 $pid; return 1
    fi

    sleep 10
  done

  return 0
}

read -r pid < ~/.offlineimap/pid

if ps $pid &>/dev/null; then
  exit 1
fi

/usr/local/bin/offlineimap -o -u quiet & monitor $!
