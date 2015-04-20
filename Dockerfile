
FROM phusion/baseimage:0.9.11


MAINTAINER aptalca

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
wget \
python \
xdg-utils

RUN mkdir /opt/calibre && mkdir /opt/calibre/library

VOLUME ["/opt/calibre"]

EXPOSE 8080

ADD calibreinstall.sh /root/calibre/calibreinstall.sh
RUN chmod +x /root/calibre/calibreinstall.sh && /root/calibre/calibreinstall.sh

ENTRYPOINT ["/usr/bin/calibre-server", "--with-library=/opt/calibre/library"]
