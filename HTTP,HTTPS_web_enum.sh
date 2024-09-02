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



run_whois(){
	echo "--- Executing WHOIS on valid urls ---"
	touch whois_output.txt
	cat url.txt | while read line;
 	do
  		whois $line >> whois_output.txt
    	done;

run_curl(){
	echo "--- Executing CURL on valid urls ---"
	touch curl_output.txt
	cat url.txt | while read line;
 	do
  		curl -I $line >> curl_output.txt
    	done;

run_hakrawler(){
	echo "--- Executing HAKRAWLER on valid urls ---"
	touch hakrawler_output.txt
	cat url.txt | while read line;
 	do
  		echo $line | hakrawler -u >> hakrawler_output.txt
    	done;
}

run_ferox(){
	echo "--- Executing FEROXBUSTER on valid urls ---"
	cat url.txt | feroxbuster --stdin -k -s 200 301 302 -d 2 -w "/usr/share/seclists/Discovery/Web-Content/combined_words.txt" -o feroxScan.txt
}
