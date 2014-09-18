FROM wlanslovenija/runit

MAINTAINER Jernej Kos <jernej@kos.mx>

RUN apt-get update -q -q && \
 apt-get install git build-essential libnl-dev bridge-utils --yes --force-yes && \
 git clone https://github.com/wlanslovenija/tunneldigger.git /tmp/tunneldigger-build && \
 cd /tmp/tunneldigger-build/client && \
 make && \
 cp l2tp_client /usr/local/bin/tunneldigger && \
 rm -rf /tmp/tunneldigger-build && \
 apt-get purge git build-essential --yes --force-yes && \
 apt-get autoremove --yes --force-yes

COPY ./etc /etc

