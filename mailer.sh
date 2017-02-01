#!/bin/bash

EMAIL="billmckinley@hotmail.com"

cd /home/bill/Backups

#Send a copy of log for today to Admin
echo "File transfer and sycro results for $(date '+%F')" | mail -s "Transfer/Syncro log for $(date '+%F')" -a transfer_log-$(date '+%F').txt $EMAIL

exit 0
