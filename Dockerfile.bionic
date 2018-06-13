FROM ubuntu:18.04

RUN apt update                                                             && \
    apt install -y --no-install-recommends                                    \
      dpkg-dev                                                             && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /

VOLUME [ "/repo" ]

WORKDIR /repo

ENTRYPOINT ["/docker-entrypoint.sh"]
