#!/bin/bash -e

#flag = true; tail -n-1 -f /Applications/DevDesktop/apache/logs/error_log |  while read line; do if [ $flag ]; then echo "$(tail -n3 /Applications/DevDesktop/apache/logs/error_log)" | terminal-notifier -sound default; flag = false;   done; flag=true 

flag=true;

function trigger_notification(){
# if (( $flag == true )); then
echo "$(tail -n3 /Applications/DevDesktop/apache/logs/error_log)" | terminal-notifier -sound default;
tail -n100 /Applications/DevDesktop/apache/logs/error_log > /tmp/log.txt;
open /tmp/log.txt

error_notify;
# fi;
# flag=false
}

function error_notify(){
# tail -n0 -f /Applications/DevDesktop/apache/logs/error_log |  while read line; do trigger_notification(); done #echo "$(tail -n3 /Applications/DevDesktop/apache/logs/error_log)" | terminal-notifier -sound default; break;  done;

tail -n0 -f /Applications/DevDesktop/apache/logs/error_log | while read -r line; do  trigger_notification; break; done # ; done #echo "$(tail -n3 /Applications/DevDesktop/apache/logs/error_log)" | terminal-notifier -sound default; break;  done;
}


error_notify
