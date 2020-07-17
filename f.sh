# Firewall 
echo "---------------------------------"
echo " Opening firewall............"
echo " "
sleep 0.5
./pt.sh
echo " " 
./myip.sh
echo "---------------------------------------------------"
# Listing IP tables
sleep 0.5
echo " Listing IP tables......"
echo "----------------------------------------------------"
echo " "
iptables -L
echo "----------------------------------------------------"
echo " "
# Clear all rules
sleep 0.5
echo " Flushing the iptables......."
/sbin/iptables -F
echo " "
sleep 0.5
echo " Clearing all rules.........."
echo " "
sleep 0.5
echo " IP table Flushed............"
echo " "
sleep 0.5
echo " Dropping Forward traffic...."
/sbin/iptables -P FORWARD DROP 
echo " "
sleep 0.5
echo " Allowing outgoing traffic..."
/sbin/iptables -P OUTPUT ACCEPT
echo " "
sleep 0.5
echo " Allowing established traffic"
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 
echo " "
sleep 0.5
echo " Allowing localhost traffic.."
/sbin/iptables -A INPUT -i lo -j ACCEPT
echo " "
sleep 0.5
echo "---------------------------------------------------- All traffic are set........--------------------------------------------------- "
echo " "
sleep 0.5
echo " Loading Rules Management section........"
echo " " 
i=1
while [ $i == 1 ]
do
 echo " "
 read -p "If you want to add new rule y/n: " pass
 case "$pass" in
  "y")echo " "
      echo " Type the rule command needed:"
      echo " "
      read -p ">> " rule
      $rule
      echo " "
      echo " Rules added..................."
      echo " "
      iptables -L
      ;;
   "n")echo " "
   echo " Defult/All rules are added........."
   echo " "
   break
   ;;
 esac
done
echo "-------------------------------------------------Rules are added------------------------------------------------------"
echo " "
echo " Accessing Rules......................... "
sleep 0.5
echo " "
i=1
while [ $i == 1 ]
do
 read -p " Enter  your ip (don't know the ip enter- help): " pass
 case "$pass" in
  "help")echo " "
         ./myip.sh
         echo " "
         read -p " Enter  your ip :" pass
         ;;
 esac
 break
done
 echo " "
echo " Allowing web server (http)..................."
/sbin/iptables -A INPUT -p tcp --dport 80 -j LOG --log-level 7 --log-prefix "Accept 80 HTTP"
/sbin/iptables -A INPUT -p tcp -d $pass --dport 80 -j ACCEPT
echo " "
sleep 0.5
echo " Allowing two types of ICMP..................."
/sbin/iptables -A INPUT -p icmp -d $pass --icmp-type 8/0 -j LOG --log-level 7 --log-prefix "Accept Ping"
/sbin/iptables -A INPUT -p icmp -d $pass --icmp-type 8/0 -j ACCEPT
/sbin/iptables -A INPUT -p icmp -d $pass --icmp-type 8/0 -j LOG --log-level 7 --log-prefix "Accept Time Exceeded"
/sbin/iptables -A INPUT -p icmp -d $pass --icmp-type 11/0 -j ACCEPT
echo " "
echo "--------------------------------------- Allowed basic http, icmp protocols-------------------------------------------"
echo " ". 
echo "---------------------------------------Denying all others -----------------------------------------------------------"
/sbin/iptables -A INPUT -d $pass -j LOG --log-level 7 --log-prefix "Default Deny"
/sbin/iptables -A INPUT -j DROP
echo " "
echo "-----------------------------------------------------------------------------------------------------------------------"
echo " "
echo "------Congratulation!!!!!--------------------Firewall all set ----------- feel free-------do your work------------ "
echo " "
