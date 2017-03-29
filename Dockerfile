FROM thimico/alpine

RUN apk-install iptables ppp pptpd

COPY /root/etc/pptpd.conf    /etc/
COPY /root/etc/ppp/chap-secrets  /etc/ppp/
COPY /root/etc/ppp/pptpd-options /etc/ppp/
RUN mknod /dev/ppp c 108 0
RUN chmod 600 /dev/ppp

EXPOSE 1723

CMD set -xe \
    && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \
    && pptpd \
    && syslogd -n -O /dev/stdout