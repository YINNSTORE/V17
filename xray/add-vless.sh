#!/bin/bash

clear
exitsc="\033[0m"
y="\033[1;93m"
j="\033[0;33m"
function lane() {
echo -e "${y}────────────────────────────────────────────${exitsc}"
}
url_izin="https://raw.githubusercontent.com/YINNSTORE/izinsc/main/ip"
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
useexp=$(wget -qO- $url_izin | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
lane
echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          ${exitsc}"
lane
echo -e ""
echo -e "            \033[0;35mPERMISSION DENIED !${exitsc}"
echo -e "   ${j}Your VPS${exitsc} $ipsaya ${j}Has been Banned${exitsc}"
echo -e "     ${j}Buy access permissions for scripts${exitsc}"
echo -e "             ${j}Contact Admin :${exitsc}"
echo -e "      \033[0;36mWhatsapp${exitsc} wa.me/6285935195701"
lane
exit
fi
}
checking_sc
source /var/lib/xdxl/ipvps.conf
domain=$(cat /etc/xray/domain)

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "===============[ Add Title Account ]=============="
echo ""

		read -rp "Username: " -e user
                #read -rp "Limit ip: " -e limit
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		echo -e "======================================"
			echo ""
			echo "Nama sudah ada, Silahkan Gunakan Username lain !!!"
			echo ""
			read -n 1 -s -r -p "Press any key to back on menu"
			menu-vless
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "masa aktif : " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
systemctl restart xray
clear
echo -e "===============[ VLESS ]==============" | tee -a /etc/log-create-user.log
echo -e "" | tee -a /etc/log-create-user.log
echo -e "Username       : ${user}" | tee -a /etc/log-create-user.log
echo -e "Expired On     : ${exp}" | tee -a /etc/log-create-user.log
echo -e "Domain         : ${domain}" | tee -a /etc/log-create-user.log
echo -e "Port SSL/TLS   : 443, 8443" | tee -a /etc/log-create-user.log
echo -e "Port none TLS  : 80, 8080" | tee -a /etc/log-create-user.log
echo -e "Uuid           : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Encryption     : none" | tee -a /etc/log-create-user.log
echo -e "Network        : ws" | tee -a /etc/log-create-user.log
echo -e "Path           : /vless" | tee -a /etc/log-create-user.log
echo -e "Servicename    : vless" | tee -a /etc/log-create-user.log
echo -e "" | tee -a /etc/log-create-user.log
echo -e "===============" | tee -a /etc/log-create-user.log
echo -e "Link TLS       : ${vlesslink1}" | tee -a /etc/log-create-user.log
echo -e "==============="
echo -e "Link none TLS  : ${vlesslink2}" | tee -a /etc/log-create-user.log
echo -e "===============" | tee -a /etc/log-create-user.log
echo -e "Link GRPC      : ${vlesslink3}" | tee -a /etc/log-create-user.log
echo -e "===============" | tee -a /etc/log-create-user.log
