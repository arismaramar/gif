#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : Geo Project
# (C) Copyright 2022
# =========================================
P='\e[0;35m'
B='\033[0;36m'
G='\e[0;32m'
N='\e[0m'
export Server_URL="raw.githubusercontent.com/wunuit/Multiport/main"

clear
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
MYIP=$(wget -qO- ipv4.icanhazip.com);
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple='\e[0;35m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
clear
domain=$(cat /usr/local/etc/xray/domain)

# // nginx status
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // xray status
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

# // script version
myver="$(cat /home/ver)"

# // script version check
serverV=$( curl -sS https://${Server_URL}/version_check_v2)

function updatews(){
clear
echo -e "[ ${GREEN}INFO${NC} ] Check for Script updates . . ."
sleep 1
cd
wget -q -O /root/update-v2.sh "https://${Server_URL}/update-v2.sh" && chmod +x update-v2.sh && ./update-v2.sh
sleep 1
rm -f /root/update-v2.sh
rm -f /home/ver
version_check_v2=$( curl -sS https://${Server_URL}/version_check_v2)
echo "$version_check_v2" >> /home/ver
clear
echo ""
echo -e "[ ${GREEN}INFO${NC} ] Successfully Up To Date!"
sleep 1
echo ""
read -n 1 -s -r -p "Press any key to continue..."
menu
}

echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 INFO SERVER                \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
load_cpu=$(printf '%-3s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
ram_used=$(free -m | grep Mem: | awk '{print $3}')
total_ram=$(free -m | grep Mem: | awk '{print $2}')
ram_usage=$(echo "scale=2; ($ram_used / $total_ram) * 100" | bc | cut -d. -f1)
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s icanhazip.com/ip )
daily_usage=$(vnstat -d --oneline | awk -F\; '{print $6}' | sed 's/ //')
monthly_usage=$(vnstat -m --oneline | awk -F\; '{print $11}' | sed 's/ //')
if [ "$cekup" = "day" ]; then
echo -e " System Uptime      :  $uphours $upminutes $uptimecek"
else
echo -e " System Uptime      :  $uphours $upminutes"
fi
echo -e " Memory Usage       :  ${ram_used}MB / ${total_ram}MB (${ram_usage}%)"
echo -e " CPU Load           :  $load_cpu"
echo -e " VPN Core           :  XRAY-CORE"
echo -e " Domain             :  $domain"
echo -e " IP Address         :  $IPVPS"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "     [ XRAY-CORE${NC} : ${status_xray} ]   [ NGINX${NC} : ${status_nginx} ]"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e "      \033[1;37m MULTIPORT SSH XRAY WEBSOCKET BY ANGGUN\033[0m"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " Daily Data Usage   :  ${yell}$daily_usage${N}"
echo -e " Monthly Data Usage :  ${yell}$monthly_usage${N}"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m        SSH  XRAY MENU                  \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m•1 \033[0m]  SSH WEBSOCKET  Panel
 [\033[1;36m•2 \033[0m]  XRAY Vmess  Panel
 [\033[1;36m•3 \033[0m]  XRAY Vless  Panel
 [\033[1;36m•4 \033[0m]  XRAY Trojan  Panel
 [\033[1;36m•5 \033[0m]  XRAY shadowsocks-2022 Panel
 [\033[1;36m•6 \033[0m]  Log Create Account
 [\033[1;36m•7 \033[0m]  WSS Converter Panel"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                OTHERS MENU                 \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m•8 \033[0m]  Install Ads Block
 [\033[1;36m•9 \033[0m]  Install TCP BBR
 [\033[1;36m•10\033[0m]  Ads Block Panel
 [\033[1;36m•11\033[0m]  DNS SETING / Chang
 [\033[1;36m•12\033[0m]  Netflix Checker
 [\033[1;36m•13\033[0m]  Limit Bandwith Speed VPS"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                SYSTEM MENU                 \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m•14\033[0m]  Change Xray-core Mod 
 [\033[1;36m•15\033[0m]  RChange Xray-core Official
 [\033[1;36m•16\033[0m]  Change Domain
 [\033[1;36m•17\033[0m]  Renew Certificate XRAY
 [\033[1;36m•18\033[0m]  Check VPN Status
 [\033[1;36m•19\033[0m]  Check VPN Port
 [\033[1;36m•20\033[0m]  Restart VPN Services
 [\033[1;36m•21\033[0m]  Speedtest VPS
 [\033[1;36m•22\033[0m]  Check RAM
 [\033[1;36m•23\033[0m]  Check Bandwith
 [\033[1;36m•24\033[0m]  Backup
 [\033[1;36m•25\033[0m]  Restore
 [\033[1;36m•26\033[0m]  Reboot
"
if [[ $serverV > $myver ]]; then
echo -e " [\033[1;36m•24\033[0m]  Update Autoscript To V$serverV\n"
up2u="updatews"
else
up2u="menu"
fi
echo -e " \033[1;37mType [ x ] To Exit From Menu \033[0m"
echo ""
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " Version       :\033[1;36m Multiport Websocket $myver\e[0m"
echo -e " Client Name   : ANGGUN"
echo -e " Expiry Script : FREE"
echo -e " Status Script : PREMIUM"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo ""
echo -ne " Select menu : "; read opt
case $opt in
1) clear ; menu-ssh ; read -n1 -r -p "Press any key to continue..." ; menu ;;
2) clear ; menu-vmess ; read -n1 -r -p "Press any key to continue..." ; menu ;;
3) clear ; menu-vless ; read -n1 -r -p "Press any key to continue..." ; menu ;;
4) clear ; menu-tr ; read -n1 -r -p "Press any key to continue..." ; menu ;;
5) clear ; menu-ss2022 ; read -n1 -r -p "Press any key to continue..." ; menu ;;
6) clear ; log-create ; read -n1 -r -p "Press any key to continue..." ; menu ;;
7) clear ; wssgen ; read -n1 -r -p "Press any key to continue..." ; menu ;;
8) clear ; ins-helium ; read -n1 -r -p "Press any key to continue..." ; menu ;;
9) clear ; bbr ; menu ;;
10) clear ; helium ; menu ;;
11) clear ; changer ; echo "" ; menu ;;
12) clear ; nf ; echo "" ; read -n1 -r -p "Press any key to continue..." ; menu ;;
13) clear ; limit ; echo "" ; menu ;;
14) clear ; xraymod  ; menu ;;
15) clear ; xrayofficial ; menu ;;
16) clear ; dns ; menu ;;
17) clear ; certxray ; menu ;;
18) clear ; status ; read -n1 -r -p "Press any key to continue..." ; menu ;;
19) clear ; info ; read -n1 -r -p "Press any key to continue..." ; menu ;;
20) clear ; restart ; menu ;;
21) clear ; speedtest ; echo "" ; read -n1 -r -p "Press any key to continue..." ; menu ;;
22) clear ; ram ; echo "" ; read -n1 -r -p "Press any key to continue..." ; menu ;;
23) clear ; vnstat ; echo "" ; read -n1 -r -p "Press any key to continue..." ; menu ;;
24) clear ; backup ; read -n1 -r -p "Press any key to continue..." ; menu ;;
25) clear ; restore ; menu ;;
26) clear ; reboot ;;
27) clear ; $up2u ; read -n1 -r -p "Press any key to continue..." ; menu ;;
00 | 0) clear ; menu ;;
x | X) exit ;;
*) clear ; menu ;;
esac
