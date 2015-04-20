
FROM phusion/baseimage:0.9.11


MAINTAINER aptalca

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
wget \
python \
xdg-utils && \

mkdir /opt/calibre && \
mkdir /opt/calibre/library

VOLUME ["/opt/calibre"]

EXPOSE 8080

RUN cd /opt && \
wget --no-check-certificate -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main('/opt/', True)"


ENTRYPOINT ["/usr/bin/calibre-server", "--with-library=/opt/calibre/library"]
