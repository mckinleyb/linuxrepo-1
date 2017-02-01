#!/bin/bash

## Get script variables from secure file:

HOME='/home/bill/Backups'
HOST=$(less $HOME/variables.txt | grep "WEBHOST" | awk '{print $2}')
WEBUSER=$(less $HOME/variables.txt | grep "WEBUSER" | awk '{print $2}')
WEBPW=$(less $HOME/variables.txt | grep "WEBPW" | awk '{print $2}')
HEARTS=$(less $HOME/variables.txt | grep "HEARTSUSER" | awk '{print $2}')
HEARTSPW=$(less $HOME/variables.txt | grep "HEARTSPW" | awk '{print $2}')
MUSTANG=$(less $HOME/variables.txt | grep "MUSTANGUSER" | awk '{print $2}')
MUSTANGPW=$(less $HOME/variables.txt | grep "MUSTANGPW" | awk '{print $2}')
PETS=$(less $HOME/variables.txt | grep "PETSUSER" | awk '{print $2}')
PETSPW=$(less $HOME/variables.txt | grep "PETSPW" | awk '{print $2}')
TIMBER=$(less $HOME/variables.txt | grep "TIMBERUSER" | awk '{print $2}')
TIMBERPW=$(less $HOME/variables.txt | grep "TIMBERPW" | awk '{print $2}')
OHFARM=$(less $HOME/variables.txt | grep "OHFARMUSER" | awk '{print $2}')
OHFARMPW=$(less $HOME/variables.txt | grep "OHFARMPW" | awk '{print $2}')
OHHUNT=$(less $HOME/variables.txt | grep "OHHUNTUSER" | awk '{print $2}')
OHHUNTPW=$(less $HOME/variables.txt | grep "OHHUNTPW" | awk '{print $2}')
OHLAND=$(less $HOME/variables.txt | grep "OHLANDUSER" | awk '{print $2}')
OHLANDPW=$(less $HOME/variables.txt | grep "OHLANDPW" | awk '{print $2}')
HUNTMONS=$(less $HOME/variables.txt | grep "HUNTMONSUSER" | awk '{print $2}')
HUNTMONSPW=$(less $HOME/variables.txt | grep "HUNTMONSPW" | awk '{print $2}')
OLDCROWHOST=$(less $HOME/variables.txt | grep "OLDCROWHOST" | awk '{print $2}')
OLDCROW=$(less $HOME/variables.txt | grep "OLDCROWUSER" | awk '{print $2}')
OLDCROWPW=$(less $HOME/variables.txt | grep "OLDCROWPW" | awk '{print $2}')
EVA=$(less $HOME/variables.txt | grep "EVAUSER" | awk '{print $2}')
EVAPW=$(less $HOME/variables.txt | grep "EVAPW" | awk '{print $2}')
EMAIL="billmckinley@hotmail.com"

cd $HOME

touch transfer_log-$(date '+%F').txt
chmod 666 transfer_log-$(date '+%F').txt

## Start FTP transfer of website backup files:
echo >> transfer_log-$(date '+%F').txt 2>&1
echo "Start FTP downloads for $(date '+%F')" >> transfer_log-$(date '+%F').txt 2>&1


date >> transfer_log-$(date '+%F').txt 2>&1
ftp -n -vv $HOST << EOT
ascii
user $WEBUSER $WEBPW
prompt off
cd ./public_html/$HEARTS/Backups
mget *
quit
EOT
HEARTCODE=$?
 if [ $HEARTCODE -eq 0 ]; then
  echo $(ls -lrt heartsf2_bkup-$(date '+%F').tar.*) >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $HEARTCODE on Hearts4Horses" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for heartsf2-bkup-$(date '+%F').tar" $EMAIL
 fi


date >> transfer_log-$(date '+%F').txt 2>&1
ftp -n -vv $HOST << EOT
ascii
user $WEBUSER $WEBPW
prompt
cd ./public_html/$MUSTANG/Backups
mget *
bye
EOT
MUSTANGCODE=$?
 if [ $MUSTANGCODE -eq 0 ]; then
  echo $(ls -lrt mustang_bkup-$(date '+%F').tar.*) >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $MUSTANGCODE on Meeting Americas Mustangs" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for mustang-bkup-$(date '+%F').tar" $EMAIL
 fi


date >> transfer_log-$(date '+%F').txt 2>&1
ftp -n -vv $HOST << EOT
ascii
user $WEBUSER $WEBPW
prompt
cd ./public_html/$PETS/Backups
mget *
bye
EOT
PETCODE=$?
 if [ $PETCODE -eq 0 ]; then
  echo $(ls -lrt petadmin_bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $PETCODE on In Home Pet Nannies" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for petadmin-bkup-$(date '+%F').tar" $EMAIL
 fi


date >> transfer_log-$(date '+%F').txt 2>&1
ftp -n -vv $HOST << EOT
ascii
user $WEBUSER $WEBPW
prompt
cd ./public_html/$TIMBER/Backups
mget *
bye
EOT
TIMBERCODE=$?
 if [ $TIMBERCODE -eq 0 ]; then
  echo $(ls -lrt otadmin_bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $TIMBERCODE on Ohio Timber" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for otadmin-bkup-$(date '+%F').tar" $EMAIL
 fi


#date >> transfer_log-$(date '+%F').txt 2>&1
#ftp -n -vv $HOST << EOT
#ascii
#user $OHFARM $OHFARMPW
#prompt
#cd /Backups
#mget *
#bye
#EOT
#OHFARMCODE=$?
# if [ $OHFARMCODE -eq 0 ]; then
#  echo $(ls -lrt $OHFARM-bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $OHFARMCODE on Ohio Farm and Hunting Land" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
#  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for $OHFARM-bkup-$(date '+%F').tar" $EMAIL
# fi


#date >> transfer_log-$(date '+%F').txt 2>&1
#ftp -n -vv $HOST << EOT
#ascii
#user $OHHUNT $OHHUNTPW
#prompt
#cd /Backups
#mget *
#bye
#EOT
#OHHUNTCODE=$?
# if [ $OHHUNTCODE -eq 0 ]; then
#  echo $(ls -lrt $OHHUNT-bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $OHHUNTCODE on Ohio Hunting and Farm Land" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
#  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for $OHHUNT-bkup-$(date '+%F').tar" $EMAIL
# fi


#date >> transfer_log-$(date '+%F').txt 2>&1
#ftp -n -vv $HOST << EOT
#ascii
#user $OHLAND $OHLANDPW
#prompt
#cd /Backups
#mget *
#bye
#EOT
#OHLANDCODE=$?
# if [ $OHLANDCODE -eq 0 ]; then
#  echo $(ls -lrt $OHLAND-bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $OHLANDCODE on Ohio Land Realty" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
#  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for $OHLAND-bkup-$(date '+%F').tar" $EMAIL
# fi


#date >> transfer_log-$(date '+%F').txt 2>&1
#ftp -n -vv $HOST << EOT
#ascii
#user $HUNTMONS $HUNTMONSPW
#prompt
#cd /Backups
#mget *
#bye
#EOT
#HUNTMONSCODE=$?
# if [ $HUNTMONSCODE -eq 0 ]; then
#  echo $(ls -lrt $HUNTMONS-bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $HUNTMONSCODE on HuntMonsterBucks.Com" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
#  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for $HUNTMONS-bkup-$(date '+%F').tar" $EMAIL
# fi


# The oldcrowinc.com website is no longer operational (2012-06-03).
#date >> transfer_log-$(date '+%F').txt 2>&1
#ftp -n -vv $OLDCROWHOST << EOT
#ascii
#user $OLDCROW $OLDCROWPW
#prompt
#cd /Backups
#mget *
#bye
#EOT
#OLDCROWCODE=$?
# if [ $OLDCROWCODE -eq 0 ]; then
#  echo $(ls -lrt $OLDCROW-bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $OLDCROWCODE on Old Crow Ink" >> transfer_log-$(date '+%F').txt 2>&1
#  echo >> transfer_log-$(date '+%F').txt 2>&1
#  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for $OLDCROW-bkup-$(date '+%F').tar" $EMAIL
# fi


date >> transfer_log-$(date '+%F').txt 2>&1
ftp -n -vv $HOST << EOT
ascii
user $WEBUSER $WEBPW
prompt
cd ./public_html/$EVA/Backups
mget *
bye
EOT
EVACODE=$?
 if [ $EVACODE -eq 0 ]; then
  echo $(ls -lrt eleanorv_bkup-$(date '+%F').tar*) >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $EVACODE on VanArsdallCPA.Com" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
  tail -n 20 transfer_log-$(date '+%F').txt | mail -s "Backup failed for eleanorv-bkup-$(date '+%F').tar" $EMAIL
 fi

echo "End FTP downloads for $(date '+%F')" >> transfer_log-$(date '+%F').txt 2>&1
echo >> transfer_log-$(date '+%F').txt 2>&1

## Remove old backup and log files on Linux-1:
rm -rvf $(find /home/bill/Backups -mtime +2 | grep -i "bkup\|log\|runbook.txt") >> transfer_log-$(date '+%F').txt 2>&1
echo >> transfer_log-$(date '+%F').txt 2>&1

echo "Starting disk syncronization for $(date '+%F') on Linux-1" >> transfer_log-$(date '+%F').txt 2>&1

sleep 5
echo "Started disk syncronization to /dev/sdc for $(date '+%F')" >> transfer_log-$(date '+%F').txt 2>&1

rsync -a -vv -P /home/bill/Backups/* /backup/Backups/ >> transfer_log-$(date '+%F').txt 2>&1

SDBSYNCERCODE=$?
 if [ $SDBSYNCERCODE -eq 0 ]; then
  echo "Disk syncronization completed on /dev/sdb" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $SDCSYNCERCODE on /dev/sdb disk syncronization" >> transfer_log-$(date '+%F').txt 2>&1
  echo >> transfer_log-$(date '+%F').txt 2>&1
  echo "Disk sycro errors on /dev/sdb $(date)" | mail -s "Disk sycronization errors /dev/sdb $(date)" -a transfer_log-$(date '+%F').txt $EMAIL
 fi

rm -rvf $(find /backup/Backups -mtime +2 | grep -i "bkup\|log\|runbook.txt") >> transfer_log-$(date '+%F').txt 2>&1

echo >> transfer_log-$(date '+%F').txt 2>&1

sleep 5

/home/bill/Backups/mailer.sh

exit 0
