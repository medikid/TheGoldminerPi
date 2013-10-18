#!/bin/bash
#
# Site: www.hackhappy.org
# Article: http://hackhappy.org/uncategorized/how-to-use-a-raspberry-pi-to-create-a-wireless-to-wired-network-bridge/
# Video: http://youtu.be/FlLLmacDqJU
# Description: Shells script to configure linux to forward traffic
# from wireless to ethernet. This is useful if you do not have wire 
# access to the router.

function ConfigNetBridge () {
	clear
	echo "############################################################"
	echo "# Configure linux to connect wifi network to wired network #"
	echo "############################################################"
	echo ""
	echo -n "Enter Preferred Static LAN IP for the Wired RJ45 Port [192.168.1.100]: "
	read lip ;
	if [ "$lip" = "" ]; then
			lip="192.168.1.100"
	fi

	echo -n "Enter LAN Netmask [255.255.255.0]: "
	read netmask ;
	if [ "$netmask" = "" ]; then
			netmask="255.255.255.0"
	fi

	echo -n "Enter LAN Subnet mask [192.168.1.0]: "
	read subnet ;
	if [ "$subnet" = "" ]; then
			subnet="192.168.1.0"
	fi
	
	echo -n "Enter LAN Gateway [192.168.1.1]: "
	read getway ;
	if [ "$gateway" = "" ]; then
			gateway="192.168.1.1"
	fi

	echo -n "Enter IP Range Start [192.168.1.101]: "
	read ipstart ;
	if [ "$ipstart" = "" ]; then
			ipstart="192.168.1.101"
	fi

	echo -n "Enter IP Range End [192.168.1.200]: "
	read ipend ;
	if [ "$ipend" = "" ]; then
			ipend="192.168.1.200"
	fi

	echo -n "Enter Wifi SSID (Access point Name): "
	read ssid ;
	echo -n "Enter Wifi Password: "
	read password ;

	echo -n "Enter LAN Device [eth0]: "
	read landv ;
	if [ "$land" = "" ]; then
			land="eth0"
	fi

	echo -n "Enter Wifi Device [wlan0]: "
	read wifid ;
	if [ "$wifid" = "" ]; then
			wifid="wlan0"
	fi

	#Update system software
	clear

	#Configure devices
	
	echo "
	auto lo
	iface lo inet loopback
	
	allow-hotplug $land
	iface $land inet static
		address $lip
		netmask $netmask
		#gateway $gateway #Not working on the same IP pool

	auto $wifid
	iface $wifid inet manual
	wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
	iface default inet dhcp

	up iptables-restore > /etc/iptables.ipv4.nat
	" > /etc/network/interfaces

	#install and configure the DHCP server
	clear

	echo "
			option domain-name \"TheGoldminerPi\";
			option domain-name-servers 8.8.8.8, 8.8.4.4;
			subnet $subnet netmask $netmask {
					range $ipstart $ipend;
					option routers $lip;
			}
	" > /etc/dhcp/dhcpd.conf
	clear
	echo "##### Restarting DHCP Server..."
	echo ""
	echo "INTERFACES=\"$land\"" >  /etc/default/isc-dhcp-server
	service isc-dhcp-server restart
	update-rc.d isc-dhcp-server enable

	#Install and configure iptables
	clear

	 echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
	 echo "1" > /proc/sys/net/ipv4/ip_forward
	 iptables -t nat -A POSTROUTING -o $wifid -j MASQUERADE
	 iptables -A FORWARD -i $wifid -o $land -m state --state RELATED,ESTABLISHED -j ACCEPT
	 iptables -A FORWARD -i $land -o $wifid -j ACCEPT
	 iptables-save > /etc/iptables.ipv4.nat

	clear
	echo "##### Installation Complete."
	echo "##### Reboot or restart networking to apply new network configuration: sudo /etc/init.d/networking"

 }

ConfigNetBridge ;
