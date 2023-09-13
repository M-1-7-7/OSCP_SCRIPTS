# Find all http and https ports
ip=$1

mkdir $ip/webEnum && cd $ip/webEnum


#Web Feroxbuster
cat ../nmapScans/sVC_Port_Scan.txt | grep "/tcp\|/udp" | grep "http" | cut -d "/" -f 1 > httpPorts.txt
cat ../nmapScans/sVC_Port_Scan.txt | grep "/tcp\|/udp" | grep "https" | cut -d "/" -f 1 >> httpPorts.txt

cat httpPorts.txt | while read line; 
do	
 	echo -e "\n===== Begining Feroxbuster for Port $line =====\n"
 	feroxbuster -C 404,500,403 -d 2 -u http://$ip:$line/ -w "/usr/share/seclists/Discovery/Web-Content/combined_words.txt" -x html,pdf,php,asp,htaccess,json,docx,xml -o ferox_port_$line.txt
done;
