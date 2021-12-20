
FROM debian:buster-slim

ARG VERSION="1.2.1"

LABEL maintainer="info@d-eubel.de"
LABEL version="v${VERSION}"

ADD http://download.repetier.com/files/server/debian-armhf/Repetier-Server-${VERSION}-Linux.deb repetier-server.deb

RUN dpkg --unpack repetier-server.deb \
    && rm -rf repetier-server.deb

RUN mkdir -p /data \
    && sed -i "s/var\/lib\/Repetier-Server/data/g" /usr/local/Repetier-Server/etc/RepetierServer.xml

EXPOSE 3344

CMD [ "/usr/local/Repetier-Server/bin/RepetierServer", "-c", "/usr/local/Repetier-Server/etc/RepetierServer.xml" ]
