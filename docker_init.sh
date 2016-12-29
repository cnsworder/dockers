#!/usr/bin/env bash
# cnsworder(cnsworder@gmail.com)

REGISTRY_SERVER="vsc3.vsct.io"

if which apt-get; then
    OS="debian"
    UPDATA="apt-get update"
    INSTALL="apt-get install -y docker.io"
else
    OS="redhat"
    INSTALL="yum install -y docker"
fi

echo "Init docker service."

if ! which docker; then
    $UPDATA
    $INSTALL
fi

export LC_ALL=en_US.UTF-8

echo "get docker registry cert."
if which wget; then
    GET=wget
else
    GET=curl
fi

CERTS_PATH=/etc/docker/certs.d/vsc3.vsct.io
if [ ! -d $CERTS_PATH ]; then
    mkdir -p $CERTS_PATH
fi

$GET http://10.68.7.156/release/docker/vsct.crt -O /etc/docker/certs.d/vsc3.vsct.io/ca.crt

echo "add dns resolv."
if ! grep "10.68.7.142" /etc/resolv.conf; then
    sed -i '1inameserver 10.68.7.142' /etc/resolv.conf
fi

HOST_NAME=`hostname`
DOCKER_EXPORT="-H tcp://0.0.0.0:2375 -H unix://var/run/docker.sock"
OVERLAY="--cluster-store=$1 --cluster-advertise=$2"

echo "set vsc3.vsct.io to default registry"
if [ $OS == "debian" ]; then
    echo "DOCKER_OPTS='--registry-mirror=https://$REGISTRY_SERVER \
             --insecure-registry $REGISTRY_SERVER \
             --label label_name=$HOST_NAME \
             $DOCKER_EXPORT \
             $OVERLAY'" >> /etc/default/docker
    cat /etc/docker/certs.d/$REGISTRY_SERVER/ca.crt >> /etc/ssl/certs/ca-certificates.crt
else
    sed -i "s,\(OPTIONS='.*\)',\1 --registry-mirror=https://$REGISTRY_SERVER \
                --insecure-registry $REGISTRY_SERVER \
                --label label_name=$HOST_NAME \
                $DOCKER_EXPORT \
                $OVERLAY',g" /etc/sysconfig/docker
    cat /etc/docker/certs.d/$REGISTRY_SERVER/ca.crt >> /etc/pki/tls/certs/ca-bundle.crt
fi


echo "Start docker daemon..."
if which systemctl; then
    systemctl enable docker
    systemctl start docker
else
    chkconfig docker on
    service docker start
fi