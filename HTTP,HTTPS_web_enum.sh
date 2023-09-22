# Find all http and https ports
ip=$1

mkdir $ip/webEnum && cd $ip/webEnum


#Web Feroxbuster
cat ../nmapScans/sVC_Port_Scan.txt | grep "/tcp\|/udp" | grep "http" | grep -v "ssl/http" | cut -d "/" -f 1 > httpPorts.txt
cat ../nmapScans/sVC_Port_Scan.txt | grep "/tcp\|/udp" | grep "https\|ssl/http" | cut -d "/" -f 1 > httpsPorts.txt

touch url.txt

uniq httpPorts.txt | while read line;
do
	echo "http://$ip:$line/" >> url.txt
done;
uniq httpsPorts.txt | while read line;
do
	echo "https://$ip:$line/" >> url.txt
done;

cat url.txt | feroxbuster --stdin -k -s 200 301 302 -d 2 -w "/usr/share/seclists/Discovery/Web-Content/combined_words.txt" -o feroxScan.txt

