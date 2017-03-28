FROM thimico/alpine

RUN apk-install pptpd iptables bash

ADD root /

EXPOSE 1723