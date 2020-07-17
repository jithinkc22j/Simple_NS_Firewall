# Changing local ip
echo "----------------------------------------------"
read -p "Enter the ip you need: "  ip
read -p "Enter the CIDR you need: " ci 
echo "----------------------------------------------"
echo " Original IP"
s= ip a | (grep -w "inet" &  grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') | grep -v "127.0.0.1"
echo "-----------------------------------------------"
echo " Changed IP "
ifconfig $(ip addr show | awk '/inet.*brd/{print $NF}') $ip/$ci
ip a | (grep -w "inet" &  grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') | (grep -v "127.0.0.1")
echo "-------------------------------------------------"
