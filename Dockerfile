FROM centos:7
MAINTAINER Rafael de Elvira <rafa@minijuegos.com>

# Install EPEL & upgrade
RUN yum -y install epel-release

RUN yum -y update\
    && yum -y upgrade

# Install dependencies
RUN yum -y install wget
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
RUN yum -y localinstall jdk-8u60-linux-x64.rpm

# Startup script
RUN mkdir -p /opt/minimonkey_server/scripts /opt/minimonkey_server/certs /opt/minimonkey_server/jar
ADD ./scripts/run.sh /opt/minimonkey_server/scripts/run.sh
RUN chmod +x /opt/minimonkey_server/scripts/run.sh

## run!
CMD /opt/minimonkey_server/scripts/run.sh
