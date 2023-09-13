# This Script will enumerate the 3 netbios port

#!/bin/bash

#Argument Supplied Check
display_usage() { 
	echo -e "\nUsage: $0 <IP Address>\n" 
	} 
# if less than X arguments supplied, display usage 
if [  $# -le 0 ] 
then 
	display_usage
	exit 1
fi 

# Variable Assignment
ip=$0
cd $ip
 
mkdir NetBIOS_Enum && cd NetBIOS_Enum

nmblookup -A $ip > nslookup.out
nbtscan $ip/30 >> nslookup.out
nmap -sU -sV -T4 --script nbstat.nse -p 137 -Pn -n $ip >> nslookup.out
