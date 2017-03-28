#!/bin/sh

set -e

# start logging
#rc-service rsyslog start
#rc-service pptpd start

# enable IP forwarding
rc-service pptpconfig start
 
# configure firewall
#iptables -t nat -A POSTROUTING -s 10.99.99.0/24 -o eth0 -j MASQUERADE
#iptables -A FORWARD -s 10.99.99.0/24 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j TCPMSS --set-mss 1356

exec "$@"
