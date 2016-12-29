FROM vsc3.vsct.io/vsnginx:latest

ADD ./confd /etc/confd
COPY confd-0.12.0-alpha3-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
CMD ["/etc/confd/run.sh"]