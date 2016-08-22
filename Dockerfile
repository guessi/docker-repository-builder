FROM ubuntu:14.04

MAINTAINER kuole_mei@trend.com.tw

RUN apt-get update && \
    apt-get install -y dpkg-dev && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /

VOLUME [ "/repo" ]

WORKDIR /repo

ENTRYPOINT ["/docker-entrypoint.sh"]
