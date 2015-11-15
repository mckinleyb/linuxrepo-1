# Runbook generation script - by Bill McKinley 

#!/bin/bash

echo "Runbook for server: $(hostname)" > $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1 2>&1
echo "HOSTNAME" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1 2>&1
hostname >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
 if [ $(uname -a | awk '{print $1}') = "Linux" ]; then
  echo "Domain Name: $(domainname)" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
  echo "FQDN: $(hostname -f)" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
    else
     if [ $(uname -a | awk '{print $1}') = "SunOS" ]; then
      echo "Domain Name: $(domainname)" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
      echo "FQDN: $(hostname)" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1 
     fi
 fi
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Physical or VM" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
 if [ $(uname -a | awk '{print $1}') = "Linux" ]; then
   PILLCODE="$(/usr/sbin/dmidecode -s system-product-name | egrep -i 'VMWare|VirtualBox|ESX' | wc -l)"
    if [ $PILLCODE -eq "0" ]; then
      echo "Physical machine" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
      echo "Serial Number: $(/usr/sbin/dmidecode -s system-serial-number)" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
        else 
      echo "Virtual Machine" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
    fi
      else
  if [ $(uname -a | awk '{print $1}') = "SunOS" ]; then
   SUNCODE="$(/usr/sbin/smbios | egrep -i 'VMWare|VirtualBox|ESX' | wc -l)"
    if [ $SUNCODE -eq "0" ]; then
      echo "Physical machine" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
      echo "Serial Number: $(/usr/sbin/smbios | egrep -i 'Serial Number' | awk '{print $2}')" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
        else
      echo "Virtual Machine" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1   
    fi
  fi
 fi
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
	
echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Release and Version INFO" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/*release | uniq >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
uname -a >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "IFCONFIG" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
/sbin/ifconfig -a >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
#echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "ETH Interface - ifcfg-eth* file(s)" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
#cat /etc/sysconfig/network-scripts/ifup-eth* >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
#echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/sysconfig/network-scripts/ifcfg-eth* >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Exports File - /etc/exports" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
if [ $(uname -a | awk '{print $1}') = "Linux" ]; then
EXPORTCODE="$(less /etc/exports | wc -l)"
 if [ $EXPORTCODE -eq "0" ]; then
  echo "/etc/exports file is empty" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
   else
  cat /etc/exports >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
 fi
else
 if [ $(uname -a | awk '{print $1}') = "SunOS" ]; then
  DFSCODE="$(less /etc/dfs/dfstab | wc -l)"
   if [ $DFSCODE -eq "0" ]; then
    echo "/etc/dfs/dfstab file is empty"
     else
    cat /etc/dfs/dfstab >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
	   fi
	 else
  echo "No export file exists"
 fi
fi
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "NETSTAT" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
netstat -nr >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "NIS information" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/yp.conf >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "SYSCONFIG Network Information" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/sysconfig/network >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "DNS Servers" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/resolv.conf >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "NTP Servers" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/ntp.conf >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "SMTP Mail Server" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
dig $(domainname) MX >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Hosts File - /etc/hosts" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/hosts >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "INITTAB" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/inittab >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "SSHD Config" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/ssh/sshd_config >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Crontabs" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "$USER crontab" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
crontab -l >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "System crontab" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/crontab >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Users" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/passwd >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Groups" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/group >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Sudoers" - /etc/sudoers >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/sudoers >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "File Systems Information" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
df -ha >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "FSTAB File" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/fstab >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Disk Information" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
/sbin/fdisk -l >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "SYSCTL.CONF Information" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/sysctl.conf >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Security/Limits Config file Info" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /etc/security/limits.conf >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "System Services - Run Level" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
/sbin/chkconfig --list >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Running Services" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
/sbin/service --status-all >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Processes/Applications" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "Root Processes" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
ps -fu root | grep -v "\[*\]" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "User Processes" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
ps -ef | grep -v root >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo  "CPU INFO" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /proc/cpuinfo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo  "MEMORY INFO" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
cat /proc/meminfo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo  "SCSI/PCI DEVICE INFO" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
/sbin/lspci >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "###########################" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "INSTALLED PACKAGES" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
echo "---------------------------" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
 if [ $(uname -a | awk '{print $1}') = "Linux" ]; then
   rpm -qa >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
   echo "$(rpm -qa | wc -l) packages installed" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
     else
   if [ $(uname -a | awk '{print $1}') = "SunOS" ]; then
    pkg list >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
    echo "$(pkg list | wc -l) packages installed" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
      else
    echo "Not a Red Hat, SUSE or Solaris server" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1
   fi
 fi
echo >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "END OF INFO" >> $(hostname)_$(date '+%F')_runbook.txt 2>&1

echo "Runbook for server: $(hostname) completed"

exit 0
