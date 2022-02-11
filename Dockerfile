# set default to 20.04 as 22.04 have not yet released officially
ARG VERSION=20.04

FROM ubuntu:${VERSION}

RUN apt update                                                             && \
    apt install -y --no-install-recommends                                    \
      dpkg-dev                                                             && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /

VOLUME [ "/repo" ]

WORKDIR /repo

ENTRYPOINT ["/docker-entrypoint.sh"]
