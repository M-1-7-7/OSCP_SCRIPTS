#!/bin/bash

# move this entire folder into a readable/writable and executable directory on  the target machine prior to comencing 

# execute the following commands for recon 

#System and User overview
echo -e "\n====== User and System Info ======" > info.out
echo -e "\n\n***user:" >> info.out
whoami >> info.out

echo -e "\n\n***host name:" >> info.out
hostname

echo -e "\n\n***group information:" >> info.out
id >> info.out

echo -e "\n\n***sudo commands:" >> info.out
sudo -l >> info.out

echo -e "\n\n***system/kernal versions: \n" >> info.out
uname -a >> info.out

echo -e "\n"
cat /etc/lsb-release >> info.out

# SUID and GUID info
echo -e "\n====== SUID GUID Info ======" >> info.out
echo -e "\n\n***SUID Bits:" >> info.out
find / -user root -perm -4000 -exec ls -ldb {} \; 2>/dev/null >> info.out

echo -e "\n\n***GUID Bits:" >> info.out
find / -user root -perm -6000 -exec ls -ldb {} \; 2>/dev/null >> info.out

# Cron Jobs
echo -e "\n====== Cron Jobs ======" >> info.out
echo -e "\n\n***Cron job log file:" >> info.out
cat /var/log/cron.log >> info.out

echo -e "\n\n***Cron Jobs Directory:" >> info.out
echo "Look through the following directory for any cron jobs that may be of interest: /etc/cron..">> info.out

# Credential hunting through config files (enable wisely as there can be alot of results)
echo -e "\n====== Config Files ======\n" > config_files.out
find / ! -path "*/proc/*" -iname "*config*" -type f 2>/dev/null >> config_files.out


# execute linpeas and output to a file to read later
chmod +x linpeas.sh
./linpeas.sh > linpeas.out
