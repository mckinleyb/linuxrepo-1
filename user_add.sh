# Bash script for Adding User Accounts from a text file and notifies account holder.

#### CAUTION unless modified, account PW is sent unencrypted via email ####

#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "Only root may add a user to the system"
        exit 1
fi

egrep "sudo" /etc/group > /dev/null
		if [ $? -ne 0 ]; then
		cp /etc/sudoers > /etc/sudoers.bkup
		groupadd sudo
		echo "Group 'sudo' added"
		echo "Please ensure 'sudo' group has proper privileges"
	else
		echo "Group 'sudo' already exists"
                echo "Please ensure 'sudo' group has proper privileges"
		fi


while read first_name last_name username email;
	do egrep "^$username" /etc/passwd > /dev/null
		if [ $? -eq 0 ]; then
                echo "A user with username $username exists!"
           else
                useradd -G sudo -m $username
                [ $? -eq 0 ] && echo "User $username has been added to system!" || echo "Failed to add user: $username"
                echo $username | mail -s "Account ID for server $(hostname)" $email

		pass=$(< /dev/urandom tr -dc A-Na-n1-9 | head -c8)
		echo "$username:$pass" | chpasswd
		[ $? -eq 0 ] && echo "User $username has updated password." || echo "Failed to update password for $username."
		echo $pass | mail -s "New account created on $(hostname)" $email

		chage -d 0 $username
		fi
        done < text_file_of_users.txt

exit 0
