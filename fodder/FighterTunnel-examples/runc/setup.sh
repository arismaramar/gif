#!/bin/bash
#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# (C) Copyright 2022
# =========================================
clear

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

apt update -y
apt full-upgrade -y
apt dist-upgrade -y
apt install socat -y
apt install python -y
apt install curl -y
apt install wget -y
apt install sed -y
apt install nano -y
apt install python3 -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cr
apt install zip -y
apt install curl pwgen openssl netcat cron -y

clear

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "status" >> .profile
#update

apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

echo -e "[ ${green}INFO${NC} ] Preparing the autoscript installation ~"
apt install git curl -y >/dev/null 2>&1
#echo -e "[ ${green}INFO${NC} ] Installation file is ready to begin !"
#sleep 1
#mkdir /var/lib/premium-script;
#mkdir /var/lib/crot-script;

clear
#mkdir /usr/local/etc/xray
#touch /usr/local/etc/xray/domain
#echo -e "${YB}Input Domain${NC} "
#echo " "
#read -rp "Input your domain : " -e dns
#if [ -z $dns ]; then
#echo -e "Nothing input for domain!"
#else
#echo "$dns" > /usr/local/etc/xray/domain
#echo "DNS=$dns" > /var/lib/dnsvps.conf
#fi
#clear


echo -e "${red}An${NC} ${green}Established By anggun 2022${NC} ${red}An${NC}"
#DOWNLOAD SOURCE SCRIPT
#clear
#echo -e "${GREEN} CUSTOM SETUP DOMAIN VPS     ${NC}"
#echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
#echo "1. Use Domain From Script / Gunakan Domain Dari"
#echo "2. Choose Your Own Domain / utk keamanan sebaik pilih 2"
#echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
#read -rp "Choose Your Domain Installation : " dom 

#if test $dom -eq 1; then
#clear
#wget -q -O /root/cf.sh https://raw.githubusercontent.com/arismaramar/gif/main/fodder/FighterTunnel-examples/runc/cf.sh
#chmod +x /root/cf.sh
#./cf.sh
#elif test $dom -eq 2; then
#read -rp "Enter Your Domain : " domen 
#echo $domen > /root/domain
#else 
#echo "Not Found Argument"
#exit 1
#fi
#echo -e "${GREEN}Done!${NC}"
#sleep 2
#clear
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
#echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
#echo "$host" >> /usr/local/etc/xray/domain
#clear
#echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
#echo -e ""
#sleep 1
#Install SSH-VPN
echo -e "\e[0;32mINSTALLING SSH-VPN...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/arismaramar/gif/main/fodder/FighterTunnel-examples/runc/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
sleep 3
clear
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 3
wget -q -O /root/ins-xray.sh https://raw.githubusercontent.com/arismaramar/gif/main/fodder/FighterTunnel-examples/runc/ins-xray.sh
chmod +x /root/ins-xray.sh
./ins-xray.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
#install ohp-server
echo -e "\e[0;32mINSTALLING OHP PORT...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/arismaramar/multiportssh/main/install/ohp.sh && chmod +x ohp.sh && ./ohp.sh
#wget https://raw.githubusercontent.com/arismaramar/multiportssh/main/install/ohp-dropbear.sh && chmod +x ohp-dropbear.sh && ./ohp-dropbear.sh
wget https://raw.githubusercontent.com/arismaramar/multiportssh/main/install/ohp-ssh.sh && chmod +x ohp-ssh.sh && ./ohp-ssh.sh
echo -e "\e[0;32mDONE INSTALLING OHP PORT\e[0m"
sleep 2
clear
#Install Websocket-SSH
echo -e "\e[0;32mINSTALLING Websocket...\e[0m"
sleep 1
#wget -q -O /root/set-br.sh https://raw.githubusercontent.com/arismaramar/gif/main/fodder/FighterTunnel-examples/runc/Websocket-SSH.sh
#chmod +x /root/set-br.sh
#./set-br.sh
#echo -e "${GREEN}Done!${NC}"
sleep 2
#Install SET-BR
echo -e "\e[0;32mINSTALLING SET-BR...\e[0m"
sleep 1
#wget -q -O /root/set-br.sh https://raw.githubusercontent.com/arismaramar/gif/main/fodder/FighterTunnel-examples/runc/set-br.sh
#chmod +x /root/set-br.sh
#./set-br.sh
#echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# Finish
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/sshvpn.sh

# Version
echo "1.0" > /home/ver
clear
echo ""
echo -e "${RB}      .-------------------------------------------.${NC}"
echo -e "${RB}      |${NC}      ${CB}Installation Has Been Completed${NC}      ${RB}|${NC}"
echo -e "${RB}      '-------------------------------------------'${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "      ${WB}Multiport Websocket Autoscript By anggun${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${WB}»»» Protocol Service «««  |  »»» Network Protocol «««${NC}  "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}An${NC} ${YB}Vmess Websocket${NC}         ${WB}|${NC}  ${YB}- Websocket (CDN) TLS${NC}"
echo -e "  ${RB}An${NC} ${YB}Vless Websocket${NC}         ${WB}|${NC}  ${YB}- Websocket (CDN) NTLS${NC}"
echo -e "  ${RB}An${NC} ${YB}Trojan Websocket${NC}        ${WB}|${NC}  ${YB}- TCP XTLS${NC}"
echo -e "  ${RB}An${NC} ${YB}Trojan TCP XTLS${NC}         ${WB}|${NC}  ${YB}- TCP TLS${NC}"
echo -e "  ${RB}An${NC} ${YB}Trojan TCP${NC}              ${WB}|${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "           ${WB}»»» YAML Service Information «««${NC}          "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}An${NC} ${YB}YAML XRAY VMESS WS${NC}"
echo -e "  ${RB}An${NC} ${YB}YAML XRAY VLESS WS${NC}"
echo -e "  ${RB}An${NC} ${YB}YAML XRAY TROJAN WS${NC}"
echo -e "  ${RB}An${NC} ${YB}YAML XRAY TROJAN XTLS${NC}"
echo -e "  ${RB}An${NC} ${YB}YAML XRAY TROJAN TCP${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "             ${WB}»»» Server Information «««${NC}                 "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}An${NC} ${YB}Timezone                : Asia/Jakarta (GMT +7)${NC}"
echo -e "  ${RB}An${NC} ${YB}Fail2Ban                : [ON]${NC}"
echo -e "  ${RB}An${NC} ${YB}Dflate                  : [ON]${NC}"
echo -e "  ${RB}An${NC} ${YB}IPtables                : [ON]${NC}"
echo -e "  ${RB}An${NC} ${YB}Auto-Reboot             : [ON]${NC}"
echo -e "  ${RB}An${NC} ${YB}IPV6                    : [OFF]${NC}"
echo -e ""
echo -e "  ${RB}An${NC} ${YB}Autoreboot On 05.00 GMT +7${NC}"
echo -e "  ${RB}An${NC} ${YB}Backup & Restore VPS Data${NC}"
echo -e "  ${RB}An${NC} ${YB}Automatic Delete Expired Account${NC}"
echo -e "  ${RB}An${NC} ${YB}Bandwith Monitor${NC}"
echo -e "  ${RB}An${NC} ${YB}RAM & CPU Monitor${NC}"
echo -e "  ${RB}An${NC} ${YB}Check Login User${NC}"
echo -e "  ${RB}An${NC} ${YB}Check Created Config${NC}"
echo -e "  ${RB}An${NC} ${YB}Automatic Clear Log${NC}"
echo -e "  ${RB}An${NC} ${YB}Media Checker${NC}"
echo -e "  ${RB}An${NC} ${YB}DNS Changer${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "              ${WB}»»» Network Port Service «««${NC}             "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}An${NC} ${YB}HTTPS                    : 443${NC}"
echo -e "  ${RB}An${NC} ${YB}HTTP                     : 80, 8080, 8880${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo ""
rm -r setup.sh
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} For Reboot") "
reboot

