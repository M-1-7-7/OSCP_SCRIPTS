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
 

# Variable Assignment

# NFS enum scan
ip=$1
cd $ip
mkdir NFS_Enum && cd NFS_Enum
#run rpcinfo to get information about whats servicses are availible
rpcinfo -p $ip > rpc_info.out

#run showmount to see what we have access to
showmount -e $ip

#if we have access to shares, mount them with the following commands
# mkdir /mnt/nfs
# mount -t nfs <remote IP>:/ /mnt/nfs
### now you should have a path to that share


