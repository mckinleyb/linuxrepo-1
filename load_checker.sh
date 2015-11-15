## Check the load every 'x' mins on target server
## Requires ssh key pair for $USER else remote server will prompt
##	'x' = interval in minutes
## Add results to txt file to be analyzed later
## Email alert if script fails

#!/bin/bash

EMAIL="yourname@yourdomain.com"  ## Substitute correct notification email
USER="user_name"  ## Substitute user_name 
SERVER1="server_name.com"  ## Substitute server URL or IP
PORT="2222"  ## Substitute configured ssh port (default is 22)

cd /var/log

ssh $USER@$SERVER1 -p $PORT 'top -b -n2 -d0.1 | awk "/^top/{i++}i==2" | grep -i Load' >> server_load_log-$(date '+%F').txt

LOADCODE=$?
 if [ $LOADCODE -ne 0 ]; then
  echo "Exit code $LOADCODE on $SERVER1 at $(date)" >> server_load_log-$(date '+%F').txt 2>&1
  echo >> server_load_log-$(date '+%F').txt 2>&1
  cat server_load_log-$(date '+%F').txt | mail -s "Server load script failed on $SERVER1" $EMAIL
 fi

exit 0
