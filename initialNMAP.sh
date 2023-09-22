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
sudo nmap -sUT -p- -Pn --min-rate 10000 -T4 $ip --open -o nmapTCPScan.txt

#formating TCP port numbers so we can perform service scans
cat nmapTCPScan.txt | grep "/tcp\|/udp" | cut -d "/" -f 1 > tcpPorts.txt
awk '{print $1}' tcpPorts.txt | paste -s -d, - > tcpPortList.txt

#scan for services on the open ports
echo -e "\n===== Begining Nmap Service Scan =====\n"
sudo nmap -sUT --min-rate 10000 -p $(cat tcpPortList.txt) -sVC -Pn $ip --open -o sVC_Port_Scan.txt

# scan for UDP ports/services

#open ports for report 
cat sVC_Port_Scan.txt | grep "PORT\|open" > ports_for_report.txt

#start web enum if HTTP ports are open
echo -e "\n===== Begining Web Service Scan =====\n"

./HTTP,HTTPS_web_enum.sh


