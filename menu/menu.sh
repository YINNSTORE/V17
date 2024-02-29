#!/bin/bash 
# COLOR VALIDATION
clear
p="\e[1;97m"
g="\033[1;92m"
gg="\e[1;32m"
y='\033[1;36m'
yy="\033[1;93m"
BGX="\033[42m"
CYAN="\033[96m"
z="\033[0;33m"
j="\033[93m"
w="\033[1;92m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[1;92m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
ISP=$(cat /root/.isp)
CITY=$(cat /root/.city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d-%m-%Y')
TIMEZONE=$(printf '%(%H-%M-%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
xp
limit-ip-ssh
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
url_izin="https://raw.githubusercontent.com/YINNSTORE/izinsc/main/ip"
rm -f /usr/bin/user
rm -f /usr/bin/e
username=$(curl -sS $url_izin | grep $MYIP | awk '{print $2}')
valid=$(curl -sS $url_izin | grep $MYIP | awk '{print $3}')
echo "$username" >/usr/bin/user
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status Expired or Active
Info="(${green}Active${NC})"
Error="(${RED}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS $url_izin | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}☑️${NC}"
else
   status_ssh="${z}OFF ${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}☑️${NC}"
else
   status_xray="${z}OFF ${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}☑️${NC}"
else
   status_nginx="${z}OFF ${NC} "
fi

vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
r="\033[1;31m"
a=" ${z}ACCOUNT" 
q="\e[1;92;41m"
echo -e ""
echo -e " ${y}╭────────────────────────────────────────────────────╮${NC}"
echo -e " ${y}│$NC $q             AUTOSCRIPT BY YINN STORE             ${NC}${y} │$NC"
echo -e " ${y}╰────────────────────────────────────────────────────╯${NC}"
echo -e " ${y}╭────────────────────────────────────────────────────❒${NC}"
echo -e " ${y}│$NC$z • $NC${r}ISP    ${yy}=$NC $ISP${NC}"
echo -e " ${y}│$NC$z • $NC${r}CITY   ${yy}=$NC $CITY${NC}"
echo -e " ${y}│$NC$z • $NC${r}OS     ${yy}=$NC $MODEL${NC}"
echo -e " ${y}│$NC$z • $NC${r}CORE   ${yy}=$NC $CORE${NC}"
echo -e " ${y}│$NC$z • $NC${r}RAM    ${yy}=$NC $uram MB / $RAM MB $NC"
echo -e " ${y}│$NC$z • $NC${r}UPTIME ${yy}=$NC $SERONLINE${NC}"
echo -e " ${y}│$NC$z • $NC${r}DOMAIN ${yy}=$z $domain${NC}"
echo -e " ${y}│$NC$z • $NC${r}IP     ${yy}=$z $IPVPS${NC}"
echo -e " ${y}╰─────────────────────────────────────────────────────❒${NC}"
echo -e " ${y}╭────────────────────────────────────────────────────╮${NC}"
echo -e " ${y}│ ${NC}${Blue} SSH$NC : $status_ssh    ${y}│$Blue NGINX$NC : $status_nginx ${y}│$Blue XRAY$NC : $status_xray     ${y}│$NC" 
echo -e " ${y}╰────────────────────────────────────────────────────╯${NC}"
echo -e "       ${z}╭─────────────────────────────────────────╮${NC}" | lolcat
echo -e "                    ${gg} TOTAL ACCOUNTS ${NC}"
echo -e ""
echo -e "               ${z}SSH/OVPN$NC    $yy=$NC$r $ssh1$NC $a"
echo -e "               ${z}VMESS$NC       $yy=$NC$r $vma$NC $a"
echo -e "               ${z}VLESS$NC       $yy=$NC$r $vla$NC $a"
echo -e "               ${z}TROJAN$NC      $yy=$NC$r $trb$NC $a"
echo -e "               ${z}SHADOWSOCK$NC  $yy=$NC$r $ssa$NC $a"
echo -e "       ${z}╰─────────────────────────────────────────╯${NC}" | lolcat
echo -e "     ${y}╭─────────────────────────────────────────────❒${NC}"
echo -e "     ${y}│$NC Version       ${yy}= $g V 17.5.12${NC}" 
echo -e "     ${y}│$NC User          ${yy}= $g $username \e[0m"
echo -e "     ${y}│$NC Script Status ${yy}= $NC $sts \e[0m"
echo -e "     ${y}│$NC Expired       ${yy}= $NC $exp ( ${w}$certifacate${NC} Days ) $NC"
echo -e "     ${y}╰─────────────────────────────────────────────❒${NC}"
echo -e " ${y}╭────────────────────────────────────────────────────╮${NC}"
echo -e " ${y}│$NC   ${Blue}[${p}01${NC}${Blue}]$NC ${gg}MENU SSH OVPN       $NC   ${Blue}[${p}07${NC}${Blue}]$NC ${gg}MENU BOT       $y │$NC" 
echo -e " ${y}│$NC   ${Blue}[${p}02${NC}${Blue}]$NC ${gg}MENU VMESS          $NC   ${Blue}[${p}08${NC}${Blue}]$NC ${gg}INFO PORT      $y │$NC"    
echo -e " ${y}│$NC   ${Blue}[${p}03${NC}${Blue}]$NC ${gg}MENU VLESS          $NC   ${Blue}[${p}09${NC}${Blue}]$NC ${gg}CHECK CPU/RAM  $y │$NC"  
echo -e " ${y}│$NC   ${Blue}[${p}04${NC}${Blue}]$NC ${gg}MENU TROJAN         $NC   ${Blue}[${p}10${NC}${Blue}]$NC ${gg}CHANGE DOMAIN  $y │$NC"
echo -e " ${y}│$NC   ${Blue}[${p}05${NC}${Blue}]$NC ${gg}MENU SHADOWSOCK     $NC   ${Blue}[${p}11${NC}${Blue}]$NC ${gg}CHECK RUNNING  $y │$NC"
echo -e " ${y}│$NC   ${Blue}[${p}06${NC}${Blue}]$NC ${gg}MENU SYSTEM         $NC   ${Blue}[${p}12${NC}${Blue}]$NC ${gg}SPEEDTEST VPS  $y │$NC"
echo -e " ${y}╰────────────────────────────────────────────────────╯${NC}"
echo
read -p "  Selected Menu ⟩ " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-ssws ;;
6) clear ; m-set ;;
7) clear ; m-bot ;;
8) clear ; prot ;;
9) clear
gotop 
echo -e " Back To Menu In 2s . . ."
sleep 2
menu ;;
10) clear ; addhost ;;
11) clear ; ckrun ;;
12) clear ; speedtest ;;
*) menu ;;
esac
