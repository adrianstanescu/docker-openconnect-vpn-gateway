FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    kmod \
    libxml2 \
    iputils-ping \
    curl \
    openconnect \
    nano \
    psmisc \
    xmlstarlet \
    iptables \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ADD docker/start.sh /usr/bin/start.sh

RUN chmod +x /usr/bin/start.sh

ADD docker/keepalive.sh /usr/bin/keepalive.sh

RUN chmod +x /usr/bin/keepalive.sh

CMD ["/entrypoint.sh"]
