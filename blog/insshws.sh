#!/bin/bash
clear
cd
wget -q -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/arismaramar/gif/main/blog/dropbear-ws.py
wget -q -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/arismaramar/gif/main/blog/ws-stunnel
wget -q -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/arismaramar/gif/main/blog/ws-ovpn.py

chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-ovpn

wget -q -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/arismaramar/gif/main/blog/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service
wget -q -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/arismaramar/gif/main/blog/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service
wget -q -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/arismaramar/gif/main/blog/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

systemctl daemon-reload
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
