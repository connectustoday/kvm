FROM centos:latest
MAINTAINER Seshan Ravikumar <seshan10@me.com>
ENV container docker

RUN yum clean all \
    && yum update -y \
    && yum install -y qemu-kvm bridge-utils iproute dnsmasq \
    && yum clean all

COPY startvm /usr/local/bin/startvm
RUN chmod u+x /usr/local/bin/startvm

VOLUME /image

ENTRYPOINT ["/usr/local/bin/startvm"]
