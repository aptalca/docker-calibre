
FROM phusion/baseimage:0.9.11

MAINTAINER aptalca

RUN mkdir /opt/calibre && mkdir /opt/calibre/library

VOLUME ["/opt/calibre"]

EXPOSE 8080

ADD calibreinstall.sh /root/calibre/calibreinstall.sh
RUN chmod +x /root/calibre/calibreinstall.sh && /root/calibre/calibreinstall.sh

ENTRYPOINT ["/usr/bin/calibre-server", "--with-library=/opt/calibre/library"]
