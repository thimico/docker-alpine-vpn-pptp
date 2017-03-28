FROM thimico/alpine

RUN apk update && apk add -y pptpd iptables rsyslog
RUN apk add openrc --no-cache

COPY ./root/etc/pptpd.conf /etc/pptpd.conf
COPY ./root/etc/ppp/pptpd-options /etc/ppp/pptpd-options
COPY ./root/etc/ppp/chap-secrets /etc/ppp/chap-secrets

COPY pptpconfig /etc/init.d/pptpconfig
RUN chmod 0777 /etc/init.d/pptpconfig

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]