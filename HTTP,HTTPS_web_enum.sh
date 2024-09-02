domain=$1
mkdir $domain && cd $domain
touch url.txt
echo "http://$domain/" >> url.txt
run_whois(){
	echo "--- Executing WHOIS on valid urls ---"
	touch whois_output.txt
	cat url.txt | while read line;
 	do
 		echo $line
  		whois $line >> whois_output.txt
    	done;
    	cat whois_output.txt
}

run_curl(){
	echo "--- Executing CURL on valid urls ---"
	touch curl_output.txt
	cat url.txt | while read line;
 	do
  		echo $line
  		curl -I $line >> curl_output.txt
    	done;
    	cat curl_output.txt
}
run_hakrawler(){
	echo "--- Executing HAKRAWLER on valid urls ---"
	touch hakrawler_output.txt
	cat url.txt | while read line;
 	do
  		echo $line
  		echo $line | hakrawler -u >> hakrawler_output.txt
    	done;
    	cat hakrawler_output.txt
}

run_ferox(){
	echo "--- Executing FEROXBUSTER on valid urls ---"
	 echo $line
	cat url.txt | feroxbuster --stdin -k -s 200 301 302 -d 2 -w "/usr/share/seclists/Discovery/Web-Content/combined_words.txt" -o feroxScan.txt
}

run_whois
run_curl
run_hakrawler
run_ferox
