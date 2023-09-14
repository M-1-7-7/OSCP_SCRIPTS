#!/bin/bash

#Argument Supplied Check
display_usage() { 
	echo -e "\nUsage: $0 <IP Address>\n" 
	} 
# if less than 3 arguments supplied, display usage 
if [  $# -le 0 ] 
then 
	display_usage
	exit 1
fi 
 
# check whether user had supplied -h or --help . If yes display usage 
if [[ ( $@ == "--help") ||  $@ == "-h" ]] 
then 
	display_usage
	exit 0
fi 

# Variable Assignment
ip=$1
scriptDir=$(pwd)

mkdir $ip && cd $ip
mkdir nmapScans && cd nmapScans

echo -e "===== Folders Created =====\n"
pwd
echo -e "\n===== Begining Nmap Port Scan =====\n"

#nmap scan to identify all open port
sudo nmap -sUT -p- -Pn -T4 $ip --open -o nmapPortScan.txt

#formating port numbers so we can perform service scans
cat nmapPortScan.txt | grep "/tcp\|/udp" | cut -d "/" -f 1 > ports.txt
awk '{print $1}' ports.txt | paste -s -d, - > portList.txt

#scan for services on the open portss
echo -e "\n===== Begining Nmap Service Scan =====\n"
sudo nmap -sUT -p $(cat portList.txt) -sVC -Pn $ip --open -o sVC_Port_Scan.txt

#open ports for report 
cat sVC_Port_Scan.txt | grep "PORT\|open" > ports_for_report.txt

#start web enum if HTTP ports are open
echo -e "\n===== Begining Web Service Scan =====\n"

echo -e  "check if the port and ip address is woking in url\n Else you will need to add the somain name to the /etc/hosts file and try access with the domain name and port\n for whichever worked, use feroxbuster to enumerate the web site."



