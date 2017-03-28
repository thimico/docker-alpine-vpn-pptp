FROM thimico/alpine

RUN apk add --no-cache iptables ppp pptpd

COPY /root/etc/pptpd.conf    /etc/
COPY /root/etc/ppp/chap-secrets  /etc/ppp/
COPY /root/etc/ppp/pptpd-options /etc/ppp/

EXPOSE 1723

CMD set -xe \
    && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && pptpd \
    && syslogd -n -O /dev/stdout