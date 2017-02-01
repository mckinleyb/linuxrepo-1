#!/bin/bash

HOST=`hostname`

cd /home/bill/Backups

> $HOST-parti_alert.log

for LINE in $(df -ah | grep -A 1 \/dev\/mapper\/ | gawk -F \  '{print $4}'); do 
	if [ $(echo $LINE | sed s'/.$//') -gt 85 ]; then 
	 echo "$(df -ah | grep -B 1 $LINE | gawk -F \  '{print $0}') - IS $LINE FULL!" >> $HOST-parti_alert.log 2>&1
	fi
done 

if [[ -s $HOST-parti_alert.log ]]; then
 echo "Action required to prevent partition from filling up" | mail -s "Full partition alert on $HOST" -a $HOST-parti_alert.log billmckinley@hotmail.com
fi

exit 0
