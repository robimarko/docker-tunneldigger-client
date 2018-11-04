FROM tozd/runit:ubuntu-bionic

VOLUME /var/log/tunneldigger

ENV TUNNELDIGGER_UUID=
ENV TUNNELDIGGER_BROKERS=
ENV TUNNELDIGGER_LIMIT_BW_DOWN=
ENV TUNNELDIGGER_BRIDGE=

RUN apt-get update -q -q && \
 apt-get --yes --force-yes install build-essential pkg-config cmake libnl-genl-3-dev libnl-3-dev git ifupdown libasyncns-dev && \
 git clone https://github.com/wlanslovenija/tunneldigger.git /tmp/tunneldigger-build && \
 cd /tmp/tunneldigger-build/client && \
 cmake . && \
 make && \
 sudo make install && \
 apt-get purge git build-essential cmake pkg-config --yes --force-yes && \
 apt-get autoremove --yes --force-yes && \
 rm -rf /tmp/tunneldigger-build

COPY ./etc /etc