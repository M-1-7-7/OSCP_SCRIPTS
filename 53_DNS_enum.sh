# DNS enumeration 

#Argument Supplied Check
display_usage() { 
	echo -e "\nUsage: $0 <IP Address> <Domain>\n" 
	} 
# if less than 3 arguments supplied, display usage 
if [  $# -le 1 ] 
then 
	display_usage
	exit 1
fi

# Variable Assignment
ip=$1
DNS=$2 

cd $ip
mkdir DNS_Enum && cd DNS_Enum

#This command will find any records the server wants to show
dig any $DNS @$ip > DNS_Full_Records.out

# Zone transfers
dig axfr @$ip > DNS_Zone_Transfers.out#Try zone transfer without domain
dig axfr @$ip $DNS >> DNS_Zone_Transfers.out#Try zone transfer guessing the domain
fierce --domain $DNS --dns-servers $ip >> DNS_Zone_Transfers.out#Will try toperform a zone transfer against every authoritative name server and if this doesn'twork, will launch a dictionary attack

# DNS Regular commands
echo("DNS Request: ")
dig A @$ip $DNS > DNS_Generic.out  #Regular DNS request

echo("DNS TXT Records: ")
dig TXT @$ip $DNS  >> DNS_Generic.out #Information

echo("DNS Emails: ") >> DNS_Generic.out
dig MX @$ip $DNS  >> DNS_Generic.out #Emails related

echo("DNS Name Resolution: ")
dig NS @$ip $DNS  >> DNS_Generic.out #DNS that resolves that name

echo("DNS Reverse Lookup: ")
dig -x @$ip $DNS  >> DNS_Generic.out #Reverse lookup


