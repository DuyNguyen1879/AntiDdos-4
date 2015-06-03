
#!/bin/bash
############### Anti DDOS ##############
iptables_log = "/ data / logs / iptables_conf.log"
Path ### Iptables configuration export and can be freely modified ###
########################################
status = `netstat -na | awk '$ 5 ~ / [0-9] +: [0-9] + / {print $ 5}' | awk -F": "- '{print $ 1}' | sort -n | uniq -c | sort -n | tail -n 1 | grep -v 127.0.0.1`
NUM = `echo $ status | awk '{print $ 1}'`
ip = `echo $ status | awk '{print $ 2}'`
result = `echo" $ NUM> 200 "| bc`
### If the number is greater than 200 simultaneous connections to kill! ###
if [$ result = 1]
then
echo IP: $ IP is over $ NUM, BAN IT!
/ sbin / iptables -I INPUT -s $ IP -j DROP
fi
