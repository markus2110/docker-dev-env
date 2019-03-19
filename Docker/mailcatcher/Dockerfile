FROM debian:9.8-slim

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        libsqlite3-dev \
        ruby2.3-dev \
        --no-install-recommends \
    \
    && gem install mailcatcher --no-rdoc --no-ri \
    && rm -r /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove


EXPOSE 1025 1080

ENTRYPOINT [ "mailcatcher" ]

CMD ["-f", "--ip", "0.0.0.0", "--smtp-port", "1025", "--http-port", "1080"]