echo "_____________________________________________"
echo " "
echo " Welcome to network and security system "
echo "---------------------------------------------"
echo " "

green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'
Escape="\033";
RedF="${Escape}[31m";
LighGreenF="${Escape}[92m";
{
  ping -c 1 google.com > /dev/null 2>&1
  if [[ "$?" != 0 ]]
  then
    echo -e $yellow " Checking For Internet: ${RedF}FAILED"
    echo
    echo -e $red "This Script Needs An Active Internet Connection"
    echo
    echo -e $yellow " Blackhack firewall Exit"
    echo && sleep 2
    exit
  else
    echo -e $yellow " Checking For Internet: ${LighGreenF}CONNECTED"
    echo " "
    echo " Enter help for more commands "
    echo " "
  fi
}

i=1
while [ $i == 1 ]
do
 read -p "blackhack$>> "  ch
 case "$ch" in
   "ip") ./myip.sh 
   ;;
   "chlip") ./ch.sh
   ;;
   "cni") ./cni.sh
   ;;
   "fw") ./f.sh
   ;;
   "help")echo " "
   echo "----------------------------------------------------"
   echo " "
   echo "  cni   - For finding Connected network interface   "
   echo "  ip    - For finding private and public ip address "
   echo "  chlip - For changing the private ip address       "
   echo "  fw    - For setting firewall                      "
   echo "  help  - For print this help summary page          "
   echo "  exit  - For exit the program                      "
   echo " "
   echo "----------------------------------------------------"
   
   ;;
   "exit") exit 
   ;;
 esac
done
