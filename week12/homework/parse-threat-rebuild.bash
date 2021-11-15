

#!/bin/bash
#Storyline : Extract IPs from  https://www.projecthoneypot.org/list_of_ips.php?t=d, https://www.projecthoneypot.org/list_of_ips.php?t=s, https://www.projecthoneypot.org/list_of_ips.php?t=p and create a fiewall ruleset

#134.119.216.167 | CR	Bad Event	214,874	2017-03-18 	2021-11-14

wget https://www.projecthoneypot.org/list_of_ips.php?t=d -O /tmp/access.log
wget https://www.projecthoneypot.org/list_of_ips.php?t=s -O /tmp/access.log
wget https://www.projecthoneypot.org/list_of_ips.php?t=p -O /tmp/access.log


egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' /tmp/access.log | sort -u | tee badIPs.txt


for eachIP in $(cat badIPs.txt)
do
	#echo "block in from ${eachIP} to any" | tee -a pf.conf

        echo "iptables -A INPUT -s ${eachIP} -j DROP" | tee -a badIPS.iptables
done

