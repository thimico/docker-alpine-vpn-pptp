#!/bin/bash  
### BEGIN INIT INFO
# Provides:          pptpconfig
# Required-Start:    
# Required-Stop:
# Default-Start:     
# Default-Stop:
# Short-Description: pptpconfig.
# Description:       pptpconfig.
### END INIT INFO
# Source function library  
. /lib/lsb/init-functions
  
# start function  
start() { 
    sysctl -w net.ipv4.ip_forward=1

# configure firewall
    iptables -t nat -A POSTROUTING -s 10.99.99.0/24 -o eth0 -j MASQUERADE
    iptables -A FORWARD -s 10.99.99.0/24 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j TCPMSS --set-mss 1356  
    exit 0;
}  
 
case "$1" in  
start)  
  start  
  ;;  
stop)   
  ;;  
reload|restart)   
  ;;  
status)   
  ;;  
*)  
  echo $"Usage: $0 {start|stop|restart|status}"  
  exit 1  
esac