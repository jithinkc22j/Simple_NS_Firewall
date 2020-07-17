# Finding Connected Network interface
echo "--------------------------------------"
echo " Connected networkinterface:"
echo "--------------------------------------"
echo " "
echo "$(ip addr show | awk '/inet.*brd/{print $NF}')"
echo " "
echo "--------------------------------------"
