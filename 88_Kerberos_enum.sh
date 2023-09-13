# this script will execute a series of commands to enumerate the kerberos service

#Argument Supplied Check
display_usage() { 
	echo -e "\nUsage: $0 <IP Address> <Domain> <User Name Wordlist>\n" 
	} 
# if less than 3 arguments supplied, display usage 
if [  $# -le 2 ] 
then 
	display_usage
	exit 1
fi 

# Variable Assignment
$ip = $1
$Domain = $2
$UserList = $3

# Pre-Creds
nmap -p 88 --script=krb5-enum-users --script-args krb5-enum-users.realm=$ip,userdb=$UserList $ip

