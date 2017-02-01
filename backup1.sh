# Full site automated zip backup and rotator by Bill McKinley

#!/bin/bash

cd /home/bill

tar -Ppzcf /home/bill/Backups/linux-1-bkup-$(date '+%F').tar --exclude="Backups/*" --exclude="*bkup*.tar*" --exclude="*.zip" --exclude="*.gz*" --exclude="*Dell_Backup*" --exclude="*.iso" --exclude="*ISO*" --exclude="*KVM*" --exclude="*.vdi" --exclude="*.vmdk" --exclude="*.bz2" .;

#cd /home/bill/Backups

#split -d -b 2000m linux-1-bkup-$(date '+%F').tar linux-1-bkup-$(date '+%F').tar.;

#rm /home/bill/linux-1-bkup-$(date '+%F').tar;

#mv linux-1-bkup-$(date '+%F').tar* /home/bill/Backups/;

exit 0
