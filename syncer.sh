# Rsync HDD backup script

#!/bin/bash

EMAIL="billmckinley@hotmail.com"

cd /home/bill/Backups

#Sync from sda to sdb drive:

#sudo mount /dev/sdb1 /media/

sleep 5
echo "Started disk syncronization to /dev/sdb for $(date '+%F')" >> transfer_log-$(date '+%F').txt 2>&1
rsync -a -vv -P /home/bill/Backups/* /backups/Backups/ >> transfer_log-$(date '+%F').txt 2>&1
#rsync -a -vv -P /home/bill/Backups/* /media/Backups/ >> transfer_log-$(date '+%F').txt 2>&1
SDBSYNCERCODE=$?
 if [ $SDBSYNCERCODE -eq 0 ]; then
  echo "Disk syncronization completed on /dev/sdb" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $SDBSYNCERCODE on /dev/sdb disk syncronization" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
  echo "Disk sycro errors on /dev/sdb $(date)" | mail -s "Disk sycronization errors /dev/sdb $(date)" -a transfer_log-$(date '+%F').txt $EMAIL
 fi

rm -rvf $(find /backups/Backups -mtime +2 | grep -i "bkup\|log\|runbook.txt") >> transfer_log-$(date '+%F').txt 2>&1
#rm -rvf $(find /media/Backups -mtime +2 | grep -i "bkup\|log\|runbook.txt") >> transfer_log-$(date '+%F').txt 2>&1

#sudo umount /dev/sdb1

echo >> transfer_log-$(date '+%F').txt 2>&1

#Sync from sda to sdc drive:
#sudo mount /dev/sdc1 /media/	
#sleep 5
#echo "Started disk syncronization to /dev/sdc for $(date '+%F')" >> transfer_log-$(date '+%F').txt 2>&1
#rsync -a -vv -P /home/bill/Backups/ /media/Backups/ >> transfer_log-$(date '+%F').txt 2>&1
#SDCSYNCERCODE=$?
# if [ $SDCSYNCERCODE -eq 0 ]; then
#  echo "Disk syncronization completed on /dev/sdc" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $SDCSYNCERCODE on /dev/sdc disk syncronization" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
#  echo "Disk sycro errors on /dev/sdc $(date)" | mail -s "Disk sycronization errors /dev/sdc $(date)" -a transfer_log-$(date '+%F').txt $EMAIL
# fi

#rm -rvf $(find /media/Backups -mtime +2 | grep -i "bkup\|log") >> transfer_log-$(date '+%F').txt 2>&1

#sudo umount /dev/sdc1
#echo >> transfer_log-$(date '+%F').txt 2>&1


#Sync from sda to sdd drive:
#sudo mount /dev/sdd1 /media/
#sleep 5
#echo "Started disk syncronization to /dev/sdd for $(date '+%F')" >> transfer_log-$(date '+%F').txt 2>&1
#rsync -a -vv -P /home/bill/Backups/ /media/Backups/ >> transfer_log-$(date '+%F').txt 2>&1
#SDDSYNCERCODE=$?
# if [ $SDDSYNCERCODE -eq 0 ]; then
#  echo "Disk syncronization completed on /dev/sdd" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $SDDSYNCERCODE on /dev/sdd disk syncronization" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
#  echo "Disk sycro errors on /dev/sdd $(date)" | mail -s "Disk sycronization errors /dev/sdd $(date)" -a transfer_log-$(date '+%F').txt $EMAIL
# fi

#rm -rvf $(find /media/Backups -mtime +2 | grep -i "bkup\|log") >> transfer_log-$(date '+%F').txt 2>&1

#sudo umount /dev/sdd1
#echo >> transfer_log-$(date '+%F').txt 2>&1

exit
