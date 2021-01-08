FROM debian

MAINTAINER cnsworder <cnsworder@gmail.com>

EXPOSE 22
RUN yum install -y openssh-server

#RUN service sshd enable
RUN mkdir /workspace
ENV BASE_DEV /workspace/vscd
ADD vscd /workspace

#VOLUME ["/tmp/data"]

#USER cnsworder
WORKDIR /workspace

ENTRYPOINT ["/usr/sbin/sshd"]

CMD ["-D"]


