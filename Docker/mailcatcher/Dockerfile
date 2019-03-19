FROM alpine:3.5

RUN apk update && \
    apk add \
        make \
        g++ \
        ruby \
        ruby-dev \
        ruby-json \
        sqlite-dev \
   && gem install mailcatcher --no-rdoc --no-ri


# RUN apt-get update && \
#     apt-get install -y \
#         build-essential \
#         libsqlite3-dev \
#         ruby2.3-dev \
#         --no-install-recommends \
#     \
#     && gem install mailcatcher --no-rdoc --no-ri \
#     && rm -r /var/lib/apt/lists/* \
#     && apt-get purge -y --auto-remove

# make g++ ruby-dev


EXPOSE 1025 1080

ENTRYPOINT [ "mailcatcher" ]
CMD ["-f", "--ip", "0.0.0.0", "--smtp-port", "1025", "--http-port", "1080"]