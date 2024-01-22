#!/bin/bash

clear
echo "Checking VPS"
sleep 2

clear

domain=$(cat /etc/anggun/domain.txt)

echo -e " ━━━━━━━━━━━━━━━ " | lolcat
echo -e " Add Vmess Account " | lolcat
echo -e " ━━━━━━━━━━━━━━━ " | lolcat
read -rp "User: " -e user
egrep -w "^### $user" /etc/xray/config.json >/dev/null
if [ $? -eq 0 ]; then
echo -e "Username Sudah Ada" | lolcat
exit 0
fi
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
tls=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
none=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $tls | base64 -w 0)"
vmesslink2="vmess://$(echo $none | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray
service cron restart
clear
echo -e ""
echo -e "━━━-XRAY/VMESS-━━━" | lolcat
echo -e "Remarks        : ${user}" | lolcat
echo -e "Domain         : ${domain}" | lolcat
echo -e "port TLS       : 443" | lolcat
echo -e "port none TLS  : 80" | lolcat
echo -e "id             : ${uuid}" | lolcat
echo -e "alterId        : 0" | lolcat
echo -e "Security       : auto" | lolcat
echo -e "network        : ws" | lolcat
echo -e "path           : /all(multi/dynamic) bebas" | lolcat
echo -e "━━━━━━━━━━━━━━━" | lolcat
echo -e "link TLS       : ${vmesslink1}" | lolcat
echo -e "━━━━━━━━━━━━━━━" | lolcat
echo -e "link none TLS  : ${vmesslink2}" | lolcat
echo -e "━━━━━━━━━━━━━━━" | lolcat
echo -e "link  GRPC  : ${vmesslink3}" | lolcat
echo -e "━━━━━━━━━━━━━━━" | lolcat
echo -e "Expired On     : $exp" | lolcat
echo -e ""
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu

