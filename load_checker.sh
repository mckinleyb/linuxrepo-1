## Check the load every 'x' mins on target server
##	add */'x' * * * * bill /home/bill/Backups/load_checker.sh to /etc/crontab to run
##	'x' = interval in minutes
## Add results to txt file to be analyzed later
## Email alert if script fails

#!/bin/bash

EMAIL="billmckinley@hotmail.com"
HEARTSUSER="heartsf2"
SERVER1="hearts4horses.com"
PORT="2222"

cd /home/bill/Backups

ssh $HEARTSUSER@$SERVER1 -p $PORT 'top -b -n2 -d0.1 | awk "/^top/{i++}i==2" | grep -i Load' >> server_load_log-$(date '+%F').txt

LOADCODE=$?
 if [ $LOADCODE -ne 0 ]; then
  echo "Exit code $LOADCODE on Hearts4Horses at $(date)" >> server_load_log-$(date '+%F').txt 2>&1
  echo >> server_load_log-$(date '+%F').txt 2>&1
  cat server_load_log-$(date '+%F').txt | mail -s "Server load script failed on $SERVER1" $EMAIL
 fi

exit
