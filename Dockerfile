FROM centos

MAINTAINER cnsworder <cnsworder@gmail.com>

EXPOSE 22
#RUN yum install gcc -y

#RUN service sshd enable
RUN mkdir /workspace
ENV BASE_DEV /workspace/vscd
ADD vscd /workspace

#VOLUME ["/tmp/data"]

#USER cnsworder
WORKDIR /workspace

#ENTRYPOINT ["/usr/bin"]

#CMD ["-l"]


