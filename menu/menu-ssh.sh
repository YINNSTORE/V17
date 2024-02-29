#!/bin/bash
RED="\033[31m"
g="\033[1;92m"
y='\033[1;93m'
u="\033[0;36m"
NC="\e[0m"
IPVPES="https://raw.githubusercontent.com/YINNSTORE/izinsc/main/ip"
clear
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
  useexp=$(wget -qO- $IPVPES | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/zheevpn"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear
#Domain
domain=$(cat /etc/xray/domain)

echo -e "${y}┌──────────────────────────────────────────┐\033[0m"
echo -e "${y}│$NC              $g SSH & OpenVPN           ${NC}"
echo -e "${y}└──────────────────────────────────────────┘\033[0m"
echo -e "${y}┌──────────────────────────────────────────┐\033[0m"
echo -e "${y}│${NC}${g} 01.${NC} $u Create SSH & OpenVPN Account${NC}"
echo -e "${y}│${NC}${g} 02.${NC} $u Trial SSH & OpenVPN ${NC}"
echo -e "${y}│${NC}${g} 03.${NC} $u Renew SSH & OpenVPN ${NC}"
echo -e "${y}│${NC}${g} 04.${NC} $u Check User Login SSH & OpenVPN${NC}"
echo -e "${y}│${NC}${g} 05.${NC} $u Daftar Member SSH & OpenVPN ${NC}"
echo -e "${y}│${NC}${g} 06.${NC} $u Hapus SSH & OpenVpn Account ${NC}"
echo -e "${y}│${NC}${g} 07.${NC} $u Hapus User Expired SSH & OpenVPN ${NC}"
echo -e "${y}│${NC}${g} 08.${NC} $u Set up Autokill SSH ${NC}"
echo -e "${y}│${NC}${g} 09.${NC} $u Cek User Multi Login SSH ${NC}"
echo -e "${y}│${NC}${g} 10.${NC} $u Lock User SSH Account ${NC}"
echo -e "${y}│${NC}${g} 11.${NC} $u Unlock User SSH Account ${NC}"
echo -e "${y}│${NC}${g} 12.${NC} $u Config SSH Account ${NC}"
echo -e "${y}│${NC}${g} 13.${NC} $u Edit Limit IP User SSH Account ${NC}"
echo -e "${y}│${NC}${g} 00.${NC} $u Exit SSH & OpenVPN Menu${NC}"
echo -e "${y}└──────────────────────────────────────────┘\033[0m"
echo ""
read -p "Select From Options [ 1 - 13 or 00 ] : " menu
echo -e ""
case $menu in
00|0)
    menu
    ;;
10|1)
    addssh
    ;;
02|2)
    trial
    ;;
03|3)
    renewssh
    ;;
04|4)
    cekssh
    ;;
05|5)
    member
    ;;
06|6)
    delssh
    ;;
07|7)
    delexp
    ;;
08|8)
    autokill
    ;;
09|9)
    ceklim
    ;;
10)
    lock
    ;;
11)
   unlock
   ;;
12)
   user-ssh
   ;;
13)
   editsship
   ;;
*)
    m-sshws
    ;;
esac
