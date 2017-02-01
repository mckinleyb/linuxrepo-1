#!/bin/bash

> /home/bill/Backups/denylog.txt

less /var/log/secure | grep "Failed\ password\ for" | grep -o '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' > /home/bill/Backups/hitters.txt

less /home/bill/Backups/hitters.txt | sort -n | uniq -c | sort -n > /home/bill/Backups/targets.txt

n=$(tail -n 1 /home/bill/Backups/targets.txt | awk '{print $1}')

BADIP=$(tail -n 1 /home/bill/Backups/targets.txt | awk '{print $2}')

#echo $n
#echo $BADIP

IPRULE=$(less /etc/sysconfig/iptables | grep $BADIP | wc -l)

#echo $IPRULE

if [ $IPRULE == 0 ]; then
	iptables -I INPUT 1 -s $BADIP -j DROP
	service iptables save
	service iptables restart
  else
#	echo "Firewall rule exists for $BADIP"
	exit 2	
fi

exit 0
