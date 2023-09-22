# Prompt the user for a hostname or IP address
echo -n "What is the hostname or IP address?  "
read host

# Run nmap with the following options:
sudo nmap -oX tmp.xml -A -Pn -n -T4 --min-rate=6000 $host -p-

# Parse the XML output to extract ports and services
ports_services=$(cat tmp.xml | grep -E '<port protocol="tcp" portid="|<service name="http"' | awk 'BEGIN{RS="<port protocol=\"tcp\" portid=\""; FS="\">"} NR>1 {print $1}' | sed 's/<service name="http".*/http/g')

# For each port and service, run feroxbuster to perform directory brute force search
printf '%s\n' "$ports_services" | while read -r line; do
    port=$(echo $line | cut -d' ' -f1)
    service=$(echo $line | cut -d' ' -f2)
    echo "\nPERFORMING DIRECTORY BRUTE FORCE SEARCH FOR THE $service SERVICE ON PORT $port\n"
    feroxbuster -C 404,500,403 -d 2 -u http://$host:$port --wordlist "/usr/share/seclists/Discovery/Web-Content/combined_words.txt"
done

# Remove the temporary XML file
rm tmp.xml
