FROM zookeeper

ADD ./docker-entrypoint.sh /docker-entrypoint.sh
ADD ./confd /confd
ADD ./s6/etc/ /etc/s6
ADD ./s6/bin/ /bin
ADD confd-0.12.0-alpha3-linux-amd64 /usr/bin/confd

RUN chmod a+x /usr/bin/confd
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 2181
#ENTRYPOINT []
#CMD ["/docker-entrypoint.sh"]
